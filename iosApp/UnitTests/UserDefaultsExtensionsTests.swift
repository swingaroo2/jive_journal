//
//  UserDefaultsExtensionsTests.swift
//  UnitTests
//
//  Created by Zach Lockett-Streiff on 8/27/25.
//
@testable import JiveJournal
import Foundation
import Testing

extension Tag {
    @Tag static var launchTests: Self
}

@Suite struct InitialLaunchTests {
    
    @Test("Initial launch checks", .serialized, .tags(.launchTests), arguments: [
        true, false
    ])
    func firstLaunchLogicTrue(hasPriorLaunch: Bool) async throws {
        print("hasPriorLaunch: \(hasPriorLaunch)")
        UserDefaults.standard.set(hasPriorLaunch, forKey: UDFlags.hasPriorLaunch)
        #expect(UserDefaults.isFirstLaunch() != hasPriorLaunch)
        UserDefaults.standard.set(nil, forKey: UDFlags.hasPriorLaunch)
    }
}
