import XCTest
@testable import MARx

final class MARxTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MARx().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
