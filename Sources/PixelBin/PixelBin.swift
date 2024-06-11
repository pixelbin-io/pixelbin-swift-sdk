//
//  PixelBin.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

public class PixelBin {
    public static let shared = PixelBin()
    
    internal init() { }
    
    public func image(
        imagePath: String, cloud: String, zone: String? = nil, worker: Bool = false,
        transformations: [TransformationData] = [], host: String = "cdn.pixelbin.io",
        version: String = "v2"
    )-> PixelBinImage {
        return PixelBinImage(
            _imagePath: imagePath, _cloudName: cloud, _zone: zone, _worker: worker,
            _transformations: transformations, _host: host, _version: version)
    }
    
    public func image(url: String) -> PixelBinImage?{
        return try? PixelBinImage.from(url: url)
    }
    
    public func upload(
        file: URL,
        signedDetails: SignedDetails,
        callback: @escaping (Result<Any, Error>) -> Void,
        chunkSize: Int = 1024,
        concurrency: Int = 1
    ) {
        DispatchQueue.global(qos: .background).async {
            let uploadInstance = Uploader()
            uploadInstance.upload(
                file: file, signedDetails: signedDetails, chunkSize: chunkSize, concurrency: concurrency,
                completion: callback)
        }
    }
}
