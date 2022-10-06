//
//  ContentViewModel.swift
//  BSLoggerSample
//
//  Created by 永井涼 on 2022/09/27.
//

import Foundation

final class ContentViewModel: ObservableObject {
    private var count: Int = 0
    
    //Environmental setting
    func setEnvironment() {
        #if DEBUG
        BSLogger.shared.startRun(environment: .develop)
        #elseif STAGING
        BSLogger.shared.startRun(environment: .staging)
        #else
        BSLogger.shared.startRun(environment: .production)
        #endif
    }
    
    func LoggerDebug() {
        BSLogger.debug("This log output is debug")
    }
    
    func LoggerInfo() {
        BSLogger.info("This log output is Info")
    }
    
    func LoggerWarn() {
        BSLogger.warn("This log output is Warn")
    }
    
    func LoggerError() {
        BSLogger.error("This log output is Error")
    }
    
    func LoggerTimeCheker() {
        BSLogger.timeCheck(block: delayProcedureCount)
    }
    
    func delayProcedureCount() async -> Void {
        do {
            try await Task.sleep(nanoseconds: 1)
            count += 1
            BSLogger.info("1 counted after 1 second.  count: \(count)")
        } catch {
            BSLogger.error(error)
        }
    }
    
}
