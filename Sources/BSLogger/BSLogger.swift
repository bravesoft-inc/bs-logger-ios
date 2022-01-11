import Foundation

public struct BSLogger {
    public enum LogLevel: String {
        case debug
        case info
        case warn
        case error
    }

    public static func debug(_ messages: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        for message in messages {
            printToConsole(level: .debug, message: message, file: file, function: function, line: line)
        }
    }

    public static func info(_ messages: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        for message in messages {
            printToConsole(level: .info, message: message, file: file, function: function, line: line)
        }
    }

    public static func warn(_ messages: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        for message in messages {
            printToConsole(level: .warn, message: message, file: file, function: function, line: line)
        }
    }

    public static func error(_ errors: Any..., file: String = #file, function: String = #function, line: Int = #line) {
        for error in errors {
            printToConsole(level: .error, message: error, file: file, function: function, line: line)
        }
    }
}

extension BSLogger {
    private static func getClassName(from filePath: String) -> String {
        guard let fileName = filePath.components(separatedBy: "/").last else {
            return ""
        }

        return fileName.components(separatedBy: ".").first ?? ""
    }

    private static func printToConsole(level: LogLevel, message: Any, file: String, function: String, line: Int) {
        #if !RELEASE
        print(" [\(level.rawValue.uppercased())] \(getClassName(from: file)).\(function) #\(line): \(message)")
        #endif
    }
}
