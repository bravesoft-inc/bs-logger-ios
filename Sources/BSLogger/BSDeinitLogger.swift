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
        if BSLogger.environment == .develop {
            print("deinit")
        }
    }
}
