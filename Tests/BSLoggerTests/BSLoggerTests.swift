import XCTest
@testable import BSLogger

final class BSLoggerTests: XCTestCase {
    func testGetClassName() {
        let className = BSLogger.getClassName(from: #file)
        XCTAssertEqual(className, String(describing: Self.self))
    }
}
