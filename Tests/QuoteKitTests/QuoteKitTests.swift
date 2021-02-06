import XCTest
@testable import QuoteKit

final class QuoteKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(QuoteKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
