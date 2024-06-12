//
//  PixelBin.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

public class PixelBin {
    public static let shared = PixelBin()

    init() {}

    public func image(
        imagePath: String, cloud: String, zone: String? = nil, worker: Bool = false,
        transformations: [TransformationData] = [], host: String = "cdn.pixelbin.io",
        version: String = "v2"
    ) -> PixelBinImage {
        return PixelBinImage(
            _imagePath: imagePath, _cloudName: cloud, _zone: zone, _worker: worker,
            _transformations: transformations, _host: host, _version: version
        )
    }

    public func image(url: String) -> PixelBinImage? {
        return try? PixelBinImage.from(url: url)
    }

    public func upload(
        file: URL,
        signedDetails: SignedDetails,
        callback: @escaping (Result<PixelBinImage?, Error>) -> Void,
        chunkSize: Int = 1024,
        concurrency: Int = 1
    ) {
        DispatchQueue.global(qos: .background).async {
            let uploadInstance = Uploader()

            uploadInstance.upload(
                file: file,
                signedDetails: signedDetails,
                chunkSize: chunkSize,
                concurrency: concurrency
            ) { result in
                switch result {
                case let .success(_, response):
                    if let responseUrl = response?.url {
                        let image = PixelBin.shared.image(url: responseUrl)
                        print(image?.encoded ?? "no value")
                    } else {
                        callback(.failure(NSError(domain: "Failed to get upload URL", code: 0, userInfo: nil)))
                    }
                case let .failure(error):
                    callback(.failure(error))
                }
            }
        }
    }
}
