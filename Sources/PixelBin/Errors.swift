//
//  Errors.swift
//  SDKExample
//
//  Created by Dipendra Sharma on 07/06/24.
//

import Foundation

extension String: @retroactive Error {
    public var errorDescription: String? { self }
}
