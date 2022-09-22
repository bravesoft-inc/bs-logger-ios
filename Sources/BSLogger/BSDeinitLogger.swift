//
//  File.swift
//  
//
//  Created by 平石　太郎 on 2022/09/22.
//

public class BSDeinitLogger {
    deinit {
        if BSLogger.environment == .develop {
            let className = BSLogger.getClassName(from: #file)
            print("\(className) deinit")
        }
    }
}
