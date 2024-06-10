//
//  Upload.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 09/06/24.
//

import Foundation
import UniformTypeIdentifiers

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

extension Data {
  mutating func append(_ string: String) {
    if let data = string.data(using: .utf8) {
      append(data)
    }
  }
}

struct SignedDetails {
  let url: String?
  let fields: [String: String]
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

  func dataTask(
    with request: URLRequest, completionHandler: @escaping (Result<Data, Error>) -> Void
  ) -> URLSessionDataTask {
    let session = NetworkUtil.createURLSession()
    var retryCount = 0

    let task = session.dataTask(with: request) { data, response, error in
      if let error = error as NSError?, error.domain == NSURLErrorDomain,
        error.code == NSURLErrorTimedOut, retryCount < self.maxRetries
      {
        retryCount += 1
        self.dataTask(with: request, completionHandler: completionHandler).resume()
      } else if let error = error {
        completionHandler(.failure(error))
      } else if let data = data {
        completionHandler(.success(data))
      }
    }

    return task
  }
}

class UploadManager {

}

class Uploader {
  private let s3Uploader = S3Uploader()
  private let gcsUploader = GCSUploader()
  private let multipartUploader = MultipartUploader()

  func upload(
    file: URL, signedDetails: SignedDetails, chunkSize: Int, concurrency: Int = 1,
    completion: @escaping (Result<Any, Error>) -> Void
  ) {
    guard let url = signedDetails.url else {
      completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
      return
    }

    if url.contains("storage.googleapis.com") {
      gcsUploader.uploadToGCS(
        url: url, fields: signedDetails.fields, file: file, completion: completion)
    } else if url.contains("api.pixelbin") {
      multipartUploader.multipartFileUpload(
        file: file, signedDetails: signedDetails, chunkSize: chunkSize, concurrency: concurrency,
        completion: completion)
    } else {
      s3Uploader.uploadToS3(
        url: url, fields: signedDetails.fields, file: file, completion: completion)
    }
  }
}

class S3Uploader {
  func uploadToS3(
    url: String, fields: [String: String], file: URL,
    completion: @escaping (Result<Any, Error>) -> Void
  ) {
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "POST"

    let boundary = UUID().uuidString
    request.setValue(
      "multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

    let body = createMultipartBody(
      with: fields, filePathKey: "file", paths: [file.path], boundary: boundary)
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

  private func createMultipartBody(
    with parameters: [String: String]?, filePathKey: String?, paths: [String]?, boundary: String
  ) -> Data {
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
        body.append(
          "Content-Disposition: form-data; name=\"\(filePathKey ?? "file")\"; filename=\"\(filename)\"\r\n"
        )
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
        if let utType = UTType(filenameExtension: pathExtension),
          let mimeType = utType.preferredMIMEType
        {
          return mimeType
        }
      }
    }
    return "application/octet-stream"
  }
}

class GCSUploader {
  func uploadToGCS(
    url: String, fields: [String: String], file: URL,
    completion: @escaping (Result<Any, Error>) -> Void
  ) {
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "PUT"

    for (key, value) in fields {
      request.addValue(value, forHTTPHeaderField: key)
    }

    let data = try! Data(contentsOf: file)
    request.httpBody = data

    let session = NetworkUtil.createURLSession()
    session.dataTask(with: request) { data, response, error in
      if let error = error {
        completion(.failure(error))
      } else {
        completion(.success(data ?? Data()))
      }
    }.resume()
  }
}

class MultipartUploader {
  func multipartFileUpload(
    file: URL, signedDetails: SignedDetails, chunkSize: Int, concurrency: Int,
    completion: @escaping (Result<Any, Error>) -> Void
  ) {
    let fileSize = file.fileSize
    let client = NetworkUtil.createURLSession()
    let chunkSizeInBytes = 1024 * chunkSize

    DispatchQueue.global(qos: .background).async {
      var partNumber = 0
      var offset: UInt64 = 0
      var errorOccurred = false

      while offset < fileSize, !errorOccurred {
        let group = DispatchGroup()
        for _ in 0..<concurrency {
          guard offset < fileSize, !errorOccurred else { break }

          partNumber += 1
          let end = min(offset + UInt64(chunkSizeInBytes), fileSize)
          let chunk = self.readChunk(from: file, startOffset: offset, length: end - offset)

          let requestBody = MultipartBody(fields: signedDetails.fields, chunk: chunk)
          let url = "\(signedDetails.url ?? "")&partNumber=\(partNumber)"

          var request = URLRequest(url: URL(string: url)!)
          request.httpMethod = "PUT"
          request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
          request.httpBody = requestBody.data

          group.enter()
          let task = client.dataTask(with: request) { data, response, error in
            if let error = error {
              completion(.failure(error))
              errorOccurred = true
            } else if let response = response as? HTTPURLResponse, response.statusCode == 408 {
              completion(.failure(NSError(domain: "Request timed out", code: 408, userInfo: nil)))
              errorOccurred = true
            } else {
              completion(.success(data ?? Data()))
            }
            group.leave()
          }
          task.resume()

          offset = end
        }
        group.wait()
      }

      if !errorOccurred {
        // Complete the multipart upload
        self.completeMultipartUpload(
          url: signedDetails.url, fields: signedDetails.fields, partNumber: partNumber,
          completion: completion)
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

  private func completeMultipartUpload(
    url: String?, fields: [String: String], partNumber: Int,
    completion: @escaping (Result<Any, Error>) -> Void
  ) {
    guard let url = url else {
      completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
      return
    }

    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "POST"

    var body = [String: Any]()
    body["fields"] = fields
    body["parts"] = (1...partNumber).map { $0 }

    let jsonData = try! JSONSerialization.data(withJSONObject: body, options: [])
    request.httpBody = jsonData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let session = NetworkUtil.createURLSession()
    session.dataTask(with: request) { data, response, error in
      if let error = error {
        completion(.failure(error))
      } else {
        completion(.success(data ?? Data()))
      }
    }.resume()
  }
}

struct MultipartBody {
  var fields: [String: String]
  var chunk: Data

  var data: Data {
    var body = Data()
    for (key, value) in fields {
      body.append("--boundary\r\n")
      body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
      body.append("\(value)\r\n")
    }
    body.append("--boundary\r\n")
    body.append("Content-Disposition: form-data; name=\"file\"; filename=\"chunk\"\r\n")
    body.append("Content-Type: application/octet-stream\r\n\r\n")
    body.append(chunk)
    body.append("\r\n--boundary--\r\n")
    return body
  }
}
