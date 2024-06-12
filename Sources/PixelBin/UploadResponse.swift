//
//  UploadResponse.swift
//  SDKExample
//
//  Created by Anitha Sangu on 11/06/24.
//

import Foundation

struct UploadResponse: Codable {
    let orgId: Int?
    let type: String?
    let name: String?
    let path: String?
    let fileId: String?
    let access: String?
    let tags: [String]?
    let metadata: Metadata?
    let format: String?
    let assetType: String?
    let size: Int?
    let width: Int?
    let height: Int?
    let context: Context?
    let isOriginal: Bool?
    let id: String
    let url: String

    // Define nested structures
    struct Metadata: Codable {
        let source: String?
        let publicUploadId: String?
    }

    struct Context: Codable {
        let steps: [String]?
        let req: Request?
        let meta: Meta?

        struct Request: Codable {
            let headers: [String: String]?
            let query: [String: String]?
        }

        struct Meta: Codable {
            let format: String?
            let size: Int?
            let width: Int?
            let height: Int?
            let space: String?
            let channels: Int?
            let depth: String?
            let density: Int?
            let chromaSubsampling: String?
            let isProgressive: Bool?
            let hasProfile: Bool?
            let hasAlpha: Bool?
            let fileExtension: String?
            let contentType: String?
            let assetType: String?
            let isImageAsset: Bool?
            let isAudioAsset: Bool?
            let isVideoAsset: Bool?
            let isRawAsset: Bool?
            let isTransformationSupported: Bool?

            enum CodingKeys: String, CodingKey {
                case format
                case size
                case width
                case height
                case space
                case channels
                case depth
                case density
                case chromaSubsampling
                case isProgressive
                case hasProfile
                case hasAlpha
                case fileExtension = "extension"
                case contentType
                case assetType
                case isImageAsset
                case isAudioAsset
                case isVideoAsset
                case isRawAsset
                case isTransformationSupported
            }
        }
    }

    // Custom Coding Keys to handle different JSON keys and Swift variable names
    enum CodingKeys: String, CodingKey {
        case orgId
        case type
        case name
        case path
        case fileId
        case access
        case tags
        case metadata
        case format
        case assetType
        case size
        case width
        case height
        case context
        case isOriginal
        case id = "_id"
        case url
    }
}

struct UploadErrorResponse: Codable {
    let message: String?
    let status: Int?
    let code: String?
    let exception: String?
}
