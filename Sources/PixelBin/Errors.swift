//
//  Errors.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

extension String: LocalizedError {
  public var errorDescription: String? { return self }
}
