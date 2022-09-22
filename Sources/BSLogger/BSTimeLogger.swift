//
//  BSTimeLogger.swift
//  
//
//  Created by 斉藤尚也 on 2022/09/15.
//

import Foundation

public final class BSTimeCheker {
    private(set) var startTime: Date
    private(set) var finishedTime: Date?
    private(set) var elapsedSeconds: Double?
    let key: String
    
    public init(key: String = "") {
        self.startTime = .init()
        self.key = key
    }
    
    public func finish() {
        let elapsed = Date().timeIntervalSince(startTime)
        finishedTime = Date()
        elapsedSeconds = elapsed
        
        if !key.isEmpty {
            BSLogger.info("Elapsed time(\(key)): \(elapsed)(s)")
        } else {
            BSLogger.info("Elapsed time: \(elapsed)(s)")
        }
    }
    
    public func restart() {
        startTime = .init()
        finishedTime = nil
        elapsedSeconds = nil
    }
}
