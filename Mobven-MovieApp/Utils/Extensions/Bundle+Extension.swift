//
//  Bundle+Extension.swift
//  Mobven-MovieApp
//
//  Created by Elif Tum on 9.06.2024.
//

import Foundation
public extension Bundle {
    func infoForKey(_ key: String) -> String? {
        (infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
