//
//  NSError.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import Foundation
public extension NSError {
    static var generic: Error {
        NSError(domain: "", code: -1, userInfo: [:] )
    }

    static func genericError(message: String) -> NSError {
        NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
