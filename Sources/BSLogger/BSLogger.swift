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
    
    public static func timeCheck(key: String = "", task: DispatchQueue = .global(), block: @escaping () -> Void) {
        task.async {
            let speedCheker = BSTimeCheker(key: key)
            block()
            speedCheker.finish()
        }
    }
    
    @available(iOS 13.0, macOS 13.0, tvOS 13.0, watchOS 13.0, *)
    public static func timeCheck(key: String = "", block: @escaping () async -> Void) {
        Task {
            let speedCheker = BSTimeCheker(key: key)
            await block()
            speedCheker.finish()
        }
    }
}

extension BSLogger {
    internal static func getClassName(from filePath: String) -> String {
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
