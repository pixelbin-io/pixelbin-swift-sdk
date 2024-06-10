//
//  ImageUrl.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

public class PixelBinImage {
  var imagePath: String
  var cloudName: String
  var zone: String?
  var transformations: [TransformationData]
  let host: String
  let version: String
  var worker: Bool

  init(
    _imageUri: String, _cloudName: String, _zone: String?, _worker: Bool = false,
    _transformations: [TransformationData] = [], _host: String = "https://cdn.pixelbin.io",
    _version: String = "v2"
  ) {
    self.imagePath = _imageUri
    self.cloudName = _cloudName
    self.zone = _zone
    self.transformations = _transformations
    self.host = _host
    self.version = _version
    self.worker = _worker
  }

  public static func from(url urlString: String) throws -> PixelBinImage? {
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
      _imageUri: imagePath, _cloudName: cloud, _zone: zone, _worker: worker,
      _transformations: transformation, _host: host, _version: version)
  }

  public func setTransformation(transformation: TransformationData) -> PixelBinImage {
    self.transformations.append(transformation)
    return self
  }

  public func toString() -> String {
    let operations =
      self.worker
      ? "wrkr"
      : (self.transformations.encode().replacingOccurrences(of: " ", with: "").isEmpty
        ? "original" : self.transformations.encode().replacingOccurrences(of: " ", with: ""))
    let zonePart = self.zone != nil ? "\(self.zone!)/" : ""
    return
      "\(self.host)/\(self.version)/\(self.cloudName)/\(zonePart)\(operations)/\(self.imagePath)"
  }

}
