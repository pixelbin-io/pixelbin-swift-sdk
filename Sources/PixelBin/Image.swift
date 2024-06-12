//
//  Image.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

public class PixelBinImage {
    public let imagePath: String
    public let cloudName: String
    public let zone: String?
    public private(set) var transformations: [TransformationData]
    public let host: String
    public let version: String
    public let worker: Bool

    init(
        _imagePath: String, _cloudName: String, _zone: String? = nil, _worker: Bool = false,
        _transformations: [TransformationData] = [], _host: String = "cdn.pixelbin.io",
        _version: String = "v2"
    ) {
        imagePath = _imagePath
        cloudName = _cloudName
        zone = _zone
        transformations = _transformations
        host = _host
        version = _version
        worker = _worker
    }

    static func from(url urlString: String) throws -> PixelBinImage? {
        guard let url = URL(string: urlString) else {
            throw "Input is not valid url"
        }
        let components = url.pathComponents.filter { $0 != "/" }
        guard components.count >= 3 else {
            throw "Invalid pixelbin url"
        }

        let host = url.host ?? ""
        let version = components[0]
        let cloud = components[1]
        var zone: String?
        var imagePath: String
        var transformation: [TransformationData] = []
        var worker = false

        if components[2] == "wrkr" || components[2] == "original" || components[2].hasTransformation() {
            zone = nil
            imagePath = components.dropFirst(3).joined(separator: "/")
            worker = components[2] == "wrkr"
            transformation = components[2].hasTransformation() ? components[2].decode() : []
        } else if components[3] == "wrkr" || components[3] == "original"
            || components[3].hasTransformation()
        {
            zone = components[2]
            imagePath = components.dropFirst(4).joined(separator: "/")
            worker = components[3] == "wrkr"
            transformation = components[3].hasTransformation() ? components[3].decode() : []
        } else {
            throw "Invalid pixelbin url"
        }

        return PixelBinImage(
            _imagePath: imagePath, _cloudName: cloud, _zone: zone, _worker: worker,
            _transformations: transformation, _host: host, _version: version
        )
    }

    public func addTransformation(_ transformations: TransformationData...) {
        self.transformations.append(contentsOf: transformations)
    }

    public var encoded: String {
        let operations = worker ? "wrkr"
            : (transformations.encode().replacingOccurrences(of: " ", with: "").isEmpty
                ? "original" : transformations.encode().replacingOccurrences(of: " ", with: ""))
        let zonePart = zone != nil ? "\(zone!)/" : ""
        return "https://\(host)/\(version)/\(cloudName)/\(zonePart)\(operations)/\(imagePath)"
    }
}
