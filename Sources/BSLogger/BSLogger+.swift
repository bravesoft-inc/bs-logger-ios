//
//  File.swift
//  
//
//  Created by 朴根佑 on 2022/09/20.
//

import Foundation

extension Error {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "Error: \(self.localizedDescription)", file: file, function: function, line: line)
    }
}

extension Date {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension String {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self, file: file, function: function, line: line)
    }
}

extension Int {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Int64 {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension UInt {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Double {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Float {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Bool {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension NSDictionary {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Dictionary {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension NSArray {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension Array {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

#if canImport(UIKit)

import UIKit

extension CGFloat {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

extension CGPoint {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "point: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

extension CGSize {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "size: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

extension CGRect {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "origin: \(NSCoder.string(for: self.origin)) size: \(NSCoder.string(for: self.size))", file: file, function: function, line: line)
    }
}

extension CGAffineTransform {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "a: \(self.a) b: \(self.b) c: \(self.c) d: \(self.d) tx: \(self.tx) ty: \(self.ty)", file: file, function: function, line: line)
    }
}

extension UIEdgeInsets {
    public func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "edgeInsets: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

#endif
