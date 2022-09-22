//
//  BSTimeLoggerTests.swift
//  
//
//  Created by 斉藤尚也 on 2022/09/22.
//

import XCTest
@testable import BSLogger

final class BSTimeLoggerTests: XCTestCase {
    func testInit() {
        let instance = BSTimeCheker(key: "test")
        XCTAssertEqual(instance.key, "test")
        
        let instance2 = BSTimeCheker(key: "test2")
        XCTAssertEqual(instance2.key, "test2")
        
        let instance3 = BSTimeCheker(key: "test3")
        instance3.finish()
        XCTAssertEqual(instance3.key, "test3")
    }
    
    func testFinish() {
        let instance = BSTimeCheker()
        XCTAssertNil(instance.elapsedSeconds)
        XCTAssertNil(instance.finishedTime)
        
        instance.finish()
        XCTAssertNotNil(instance.elapsedSeconds)
        XCTAssertNotNil(instance.finishedTime)
        XCTAssertNotEqual(instance.startTime, instance.finishedTime)
    }
    
    func testRestart() {
        let instance = BSTimeCheker()
        instance.finish()
        XCTAssertNotNil(instance.elapsedSeconds)
        XCTAssertNotNil(instance.finishedTime)
        
        let firstStartTime = instance.startTime
        instance.restart()
        XCTAssertNil(instance.elapsedSeconds)
        XCTAssertNil(instance.finishedTime)
        XCTAssertNotEqual(firstStartTime, instance.startTime)
    }
}
