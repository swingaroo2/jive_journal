//
//  TestLogger.swift
//
//
//  Created by Zachary Lockett-Streiff on 7/31/24.
//

import Foundation
import OSLog

public class Log {
    private init () {}
    private static let logger = Logger()
    
    public static func write(_ level: OSLogType = .debug,
                             message: String = "",
                             prefix: String = #function,
                             className: String = #file) {
        let message = String.buildLogMessage(level, message, prefix, className)
        logger.log(level: .debug, "\(message)")
    }
    
    public static func divider(major: Bool = true) {
        let divider = major ? "========================================" : "----------------------------------------"
        logger.debug("\(#function) \(divider)")
    }
}

private extension String {
    static func emoji(for logType: OSLogType) -> String {
        switch logType {
        case .debug:
            return "🐞"
        default:
            return ""
        }
    }
    
    static func buildLogMessage(_ level: OSLogType = .debug,
                                _ message: String = "",
                                _ prefix: String = #function,
                                _ className: String = #file) -> String {
        let classNameComponents = className.split(separator: "/")
        let hasSwiftExtension = className.contains(".swift")
        let withoutSwiftExtension = String(classNameComponents.last?.dropLast(5) ?? "").replacingOccurrences(of: ".", with: "")
        let classNameFinal = hasSwiftExtension ? withoutSwiftExtension : className
        let emoji = String.emoji(for: level)
        let message = "\(emoji) | \(classNameFinal).\(prefix) | \(message)"
        return message
    }
}
