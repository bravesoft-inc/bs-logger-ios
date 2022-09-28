//
//  BSTimeCheker.swift
//  BSLoggerSample
//
//  Created by 永井涼 on 2022/09/27.
//

import Foundation

public final class BSTimeCheker {
    private var startTime: Date
    private let key: String
    
    public init(key: String = "") {
        self.startTime = .init()
        self.key = key
    }
    
    public func finish() {
        let elapsed = Date().timeIntervalSince(startTime)
        
        if !key.isEmpty {
            BSLogger.info("Elapsed time(\(key)): \(elapsed)(s)")
        } else {
            BSLogger.info("Elapsed time: \(elapsed)(s)")
        }
    }
}
