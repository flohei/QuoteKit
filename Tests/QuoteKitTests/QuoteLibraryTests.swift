import XCTest
@testable import QuoteKit

class MockStorage: ArrayStorage {
    override init() {
        super.init()

        let steve = Author("Steve Jobs")
        let jony = Author("Jony Ive")
        let ozzie = Author("Ray Ozzie")

        add(Quote("Complexity kills. It sucks the life out of developers, it makes products difficult to plan, build and test, it introduces security challenges, and it causes end-user and administrator frustration.", author: ozzie, source: nil))
        add(Quote("Have the courage to follow your heart and intuition. They somehow already know what you truly want to become. Everything else is secondary.", author: steve, source: nil))
        add(Quote("Don’t let the noise of others’ opinions drown out your own inner voice.", author: steve, source: "Stanford University commencement speech, 2005"))
        add(Quote("Wer ein Wofür im Leben hat kann fast jedes Wie ertragen.", author: Author("Friedrich Nietzsche")))
        add(Quote("It's very easy to be different, but it's very difficult to be better.", author: jony))
    }
}

final class QuoteLibraryTests: XCTestCase {
    var library: QuoteLibrary!

    override func setUpWithError() throws {
        library = QuoteLibrary(storage: MockStorage())
    }

    func testLibraryCreation() {
        XCTAssertNotNil(library)
    }

    func testLibraryDebugDescription() throws {
        XCTAssertEqual(library!.debugDescription, "Quote library containing 5 quotes by 4 authors")
    }

    func testGetDistinctAuthors() {
        XCTAssertEqual(library.getDistinctAuthors().count, 4)
    }

    func testGetRandomQuote() {
        XCTAssertNotNil(library.getRandomQuote())
    }

    func testGetQuotesByAuthor() {
        let steve = Author("Steve Jobs")
        let quotesBySteveJobs = library.getQuotes(by: steve)
        XCTAssertEqual(quotesBySteveJobs.count, 2)
    }

    func testAddingAndDeletingQuote() {
        XCTAssertEqual(library.getQuotes().count, 5)
        let quote = Quote("An apple a day keeps the doctor away.")
        library.add(quote)
        XCTAssertEqual(library.getQuotes().count, 6)
        library.delete(quote)
        XCTAssertEqual(library.getQuotes().count, 5)
    }

    override func tearDownWithError() throws {
        library = nil
    }
}
