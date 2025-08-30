//
//  UserDefaults+Extensions.swift
//  iosApp
//
//  Created by Zach Lockett-Streiff on 8/27/25.
//
import Foundation

extension UserDefaults {
    // TODO: setting the flag in this function isn't intuitive
    // TODO: can this flag launch untinentionally true?
    public static func isFirstLaunch() -> Bool {
        let isFirstLaunch = !Self.standard.bool(forKey: UDFlags.hasPriorLaunch)
        if isFirstLaunch {
            Self.standard.set(true, forKey: UDFlags.hasPriorLaunch)
        }
        return isFirstLaunch
    }
}

struct UDFlags {
    static let hasPriorLaunch = "hasPriorLaunch"
}
