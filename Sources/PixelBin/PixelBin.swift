//
//  PixelBin.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

class PixelBin {
  let shared = PixelBin()

  func upload(
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
