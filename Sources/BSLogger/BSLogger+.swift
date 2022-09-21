//
//  File.swift
//  
//
//  Created by 朴根佑 on 2022/09/20.
//

import Foundation

public extension Error {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "Error: \(self.localizedDescription)", file: file, function: function, line: line)
    }
}

public extension Date {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension String {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self, file: file, function: function, line: line)
    }
}

public extension Int {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Int64 {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension UInt {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Double {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Float {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Bool {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension NSDictionary {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Dictionary {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension NSArray {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension Array {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

#if canImport(UIKit)

import UIKit

public extension CGFloat {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: self.description, file: file, function: function, line: line)
    }
}

public extension CGPoint {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "point: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

public extension CGSize {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "size: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

public extension CGRect {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "origin: \(NSCoder.string(for: self.origin)) size: \(NSCoder.string(for: self.size))", file: file, function: function, line: line)
    }
}

public extension CGAffineTransform {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "a: \(self.a) b: \(self.b) c: \(self.c) d: \(self.d) tx: \(self.tx) ty: \(self.ty)", file: file, function: function, line: line)
    }
}

public extension UIEdgeInsets {
    func log(level: BSLogger.LogLevel = .debug, file: String = #file, function: String = #function, line: Int = #line) {
        BSLogger.printToConsole(level: level, message: "edgeInsets: \(NSCoder.string(for: self))", file: file, function: function, line: line)
    }
}

#endif
