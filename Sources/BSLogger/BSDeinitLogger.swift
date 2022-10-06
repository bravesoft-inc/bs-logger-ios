//
//  File.swift
//  
//
//  Created by 平石　太郎 on 2022/09/22.
//

open class BSDeinitLogger {
    public init() {
    }
    
    deinit {
        print("\(BSLogger.getClassName(from: #file)) deinit")
    }
    
//    private func getClassName(from filePath: String) -> String {
//        guard let fileName = filePath.components(separatedBy: "/").last else {
//            return ""
//        }
//
//        return fileName.components(separatedBy: ".").first ?? ""
//    }
}
