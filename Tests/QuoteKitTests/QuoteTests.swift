import XCTest
@testable import QuoteKit

final class QuoteTests: XCTestCase {
    func testDescriptionWithAuthor() {
        let author = Author("John Doe")
        let quote = Quote("An apple a day keeps the doctor away.", author: author)
        let description = quote.description

        XCTAssertEqual(description, "\"An apple a day keeps the doctor away.\"\n— John Doe")
    }

    func testDescriptionWithoutAuthor() {
        let quote = Quote("An apple a day keeps the doctor away.")
        let description = quote.description

        XCTAssertEqual(description, "\"An apple a day keeps the doctor away.\"\n— unbekannt")
    }

    static var allTests = [
        ("testDescriptionWithAuthor", testDescriptionWithAuthor),
    ]
}
