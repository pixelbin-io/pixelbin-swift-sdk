import Foundation
import UniformTypeIdentifiers

struct SignedDetails: Codable {
    let url: String?
    let fields: [String : String]
}

extension URL {
    var fileSize: UInt64 {
        do {
            let resourceValues = try self.resourceValues(forKeys: [.fileSizeKey])
            return UInt64(resourceValues.fileSize ?? 0)
        } catch {
            return 0
        }
    }
}

class NetworkUtil {
    static func createURLSession() -> URLSession {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 45
        config.timeoutIntervalForResource = 45
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue())
        return session
    }
}

class RetryInterceptor: NSObject, URLSessionDelegate {
    private let maxRetries = 3
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        return createDataTask(with: request, retryCount: 0, completionHandler: completionHandler)
    }
    
    private func createDataTask(with request: URLRequest, retryCount: Int, completionHandler: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        let session = NetworkUtil.createURLSession()
        
        return session.dataTask(with: request) { data, response, error in
            if let error = error as NSError?, error.domain == NSURLErrorDomain, error.code == NSURLErrorTimedOut, retryCount < self.maxRetries {
                self.createDataTask(with: request, retryCount: retryCount + 1, completionHandler: completionHandler).resume()
            } else if let error = error {
                completionHandler(.failure(error))
            } else if let data = data {
                completionHandler(.success(data))
            }
        }
    }
}

class Uploader {
    private let s3Uploader = S3Uploader()
    private let gcsUploader = GCSUploader()
    private let multipartUploader = MultipartUploader()
    
    func upload(file: URL, signedDetails: SignedDetails, chunkSize: Int, concurrency: Int = 1, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = signedDetails.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        if url.contains("storage.googleapis.com") {
            gcsUploader.uploadToGCS(url: url, fields: signedDetails.fields, file: file, completion: completion)
        } else if url.contains("api.pixelbin") {
            multipartUploader.multipartFileUpload(file: file, signedDetails: signedDetails, chunkSize: chunkSize, concurrency: concurrency, completion: completion)
        } else {
            s3Uploader.uploadToS3(url: url, fields: signedDetails.fields, file: file, completion: completion)
        }
    }
}

class S3Uploader {
    func uploadToS3(url: String, fields: [String: String], file: URL, completion: @escaping (Result<Any, Error>) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = createMultipartBody(with: fields, filePathKey: "file", paths: [file.path], boundary: boundary)
        request.httpBody = body
        
        let session = NetworkUtil.createURLSession()
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data ?? Data()))
            }
        }.resume()
    }
    
    private func createMultipartBody(with parameters: [String: String]?, filePathKey: String?, paths: [String]?, boundary: String) -> Data {
        var body = Data()
        
        if let parameters = parameters {
            for (key, value) in parameters {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append("\(value)\r\n")
            }
        }
        
        if let paths = paths {
            for path in paths {
                let url = URL(fileURLWithPath: path)
                let filename = url.lastPathComponent
                let data = try! Data(contentsOf: url)
                let mimetype = mimeType(for: path)
                
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(filePathKey ?? "file")\"; filename=\"\(filename)\"\r\n")
                body.append("Content-Type: \(mimetype)\r\n\r\n")
                body.append(data)
                body.append("\r\n")
            }
        }
        
        body.append("--\(boundary)--\r\n")
        return body
    }
    
    private func mimeType(for path: String) -> String {
        let url = URL(fileURLWithPath: path)
        let pathExtension = url.pathExtension
        
        if #available(iOS 14.0, *) {
            if #available(macOS 11.0, *) {
                if let utType = UTType(filenameExtension: pathExtension), let mimeType = utType.preferredMIMEType {
                    return mimeType
                }
            }
        }
        return "application/octet-stream"
    }
}

class GCSUploader {
    func uploadToGCS(url: String, fields: [String: String], file: URL, completion: @escaping (Result<Any, Error>) -> Void) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "PUT"
        
        for (key, value) in fields {
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        do {
            let data = try Data(contentsOf: file)
            request.httpBody = data
            
            let session = NetworkUtil.createURLSession()
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(data ?? Data()))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
}

class MultipartUploader {
    func multipartFileUpload(file: URL, signedDetails: SignedDetails, chunkSize: Int, concurrency: Int, completion: @escaping (Result<Any, Error>) -> Void) {
        let fileSize = file.fileSize
        let client = NetworkUtil.createURLSession()
        let chunkSizeInBytes = 1024 * chunkSize
        
        DispatchQueue.global(qos: .background).async {
            var partNumber = 0
            var offset: UInt64 = 0
            var errorOccurred = false
            var parts: [Int] = []
            
            let dispatchGroup = DispatchGroup()
            
            while offset < fileSize, !errorOccurred {
                dispatchGroup.enter()
                for _ in 0..<concurrency {
                    guard offset < fileSize, !errorOccurred else { break }
                    
                    partNumber += 1
                    let end = min(offset + UInt64(chunkSizeInBytes), fileSize)
                    let chunk = self.readChunk(from: file, startOffset: offset, length: end - offset)
                    
                    var formData = MultipartFormData()
                    signedDetails.fields.forEach { key, value in
                        formData.addField(named: key, value: value)
                    }
                    formData.addField(named: "file", filename: "chunk", data: chunk)
                    
                    let url = "\(signedDetails.url ?? "")&partNumber=\(partNumber)"
                    
                    var request = URLRequest(url: URL(string: url)!)
                    request.httpMethod = "PUT"
                    request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
                    request.setValue("multipart/form-data; boundary=\(formData.boundary)", forHTTPHeaderField: "Content-Type")
                    request.setValue("*/*", forHTTPHeaderField: "Accept")
                    request.httpBody = formData.httpBody
                    
                    //                    print("Request: \(request.cURL(pretty: true))")
                    
                    let task = client.dataTask(with: request) { data, response, error in
                        if let httpResponse = response as? HTTPURLResponse {
                            print("Response URL: \(httpResponse.url?.absoluteString ?? "")")
                            print("Response Status Code: \(httpResponse.statusCode)")
                        }
                        if let data = data, let responseString = String(data: data, encoding: .utf8) {
                            print("Response Body: \(responseString)")
                        }
                        if let error = error {
                            completion(.failure(error))
                            errorOccurred = true
                        } else {
                            parts.append(partNumber)
                            completion(.success(data ?? Data()))
                        }
                        dispatchGroup.leave()
                    }
                    task.resume()
                    
                    offset = end
                }
                dispatchGroup.wait()
            }
            
            if !errorOccurred {
                // Complete the multipart upload
                self.completeMultipartUpload(url: signedDetails.url, fields: signedDetails.fields, partNumber: partNumber, completion: completion)
            }
        }
    }
    
    private func readChunk(from file: URL, startOffset: UInt64, length: UInt64) -> Data {
        let fileHandle = try! FileHandle(forReadingFrom: file)
        fileHandle.seek(toFileOffset: startOffset)
        let data = fileHandle.readData(ofLength: Int(length))
        fileHandle.closeFile()
        return data
    }
    
    private func completeMultipartUpload(url: String?, fields: [String: String], partNumber: Int, completion: @escaping (Result<Any, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        var body = [String: Any]()
        for (key, value) in fields {
            body[key] = value
        }
        body["parts"] = (1...partNumber).map { $0 }
        
        let jsonData = try! JSONSerialization.data(withJSONObject: body, options: [])
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("Request: \(request.cURL(pretty: true))")
        
        let session = NetworkUtil.createURLSession()
        session.dataTask(with: request) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Complete Response URL: \(httpResponse.url?.absoluteString ?? "")")
                print("Complete Response Status Code: \(httpResponse.statusCode)")
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response Body: \(responseString)")
            }
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(data ?? Data()))
            }
        }.resume()
    }
}

extension URLRequest {
    public func cURL(pretty: Bool = false) -> String {
        let newLine = pretty ? "\\\n" : ""
        let method = (pretty ? "--request " : "-X ") + "\(self.httpMethod ?? "GET") \(newLine)"
        let url: String = (pretty ? "--url " : "") + "\'\(self.url?.absoluteString ?? "")\' \(newLine)"
        
        var cURL = "curl "
        var header = ""
        var data: String = ""
        
        if let httpHeaders = self.allHTTPHeaderFields, httpHeaders.keys.count > 0 {
            for (key,value) in httpHeaders {
                header += (pretty ? "--header " : "-H ") + "\'\(key): \(value)\' \(newLine)"
            }
        }
        
        if let bodyData = self.httpBody, let bodyString = String(data: bodyData, encoding: .utf8),  !bodyString.isEmpty {
            data = "--data '\(bodyString)'"
        }
        
        cURL += method + url + header + data
        
        return cURL
    }
}

public struct MultipartFormData {
    fileprivate let boundary = UUID().uuidString
    private var formData = Data()
    
    fileprivate var httpBody: Data {
        var data = formData
        data.append("--\(boundary)--")
        return data
    }
    
    public mutating func addField(named name: String, value: String) {
        formData.addField("--\(boundary)")
        formData.addField("Content-Disposition: form-data; name=\"\(name)\"")
        formData.addField()
        formData.addField(value)
    }
    
    public mutating func addField(named name: String, filename: String, data: Data) {
        formData.addField("--\(boundary)")
        formData.addField("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(filename)\"")
        formData.addField()
        formData.addField(data)
    }
}

public extension URLRequest {
    init(url: URL, timeoutInterval: TimeInterval = 60, formData: MultipartFormData) {
        self.init(url: url, timeoutInterval: timeoutInterval)
        httpMethod = "POST"
        setValue("multipart/form-data; boundary=\(formData.boundary)", forHTTPHeaderField: "Content-Type")
        setValue("*/*", forHTTPHeaderField: "Accept")
        httpBody = formData.httpBody
    }
}

fileprivate extension Data {
    mutating func append(_ string: String) {
        append(Data(string.utf8))
    }
    
    mutating func addField() {
        append(.httpFieldDelimiter)
    }
    
    mutating func addField(_ string: String) {
        append(string)
        append(.httpFieldDelimiter)
    }
    
    mutating func addField(_ data: Data) {
        append(data)
        append(.httpFieldDelimiter)
    }
}

fileprivate extension String {
    static let httpFieldDelimiter = "\r\n"
}
