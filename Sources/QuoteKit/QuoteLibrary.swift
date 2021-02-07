public class QuoteLibrary {
    private var storage: QuoteStorage
    
    public init(storage: QuoteStorage) {
        self.storage = storage
    }
    
    public func add(_ quote: Quote) {
        storage.add(quote)
    }

    public func delete(_ quote: Quote) {
        storage.delete(quote)
    }

    public func getQuotes() -> [Quote] {
        return storage.getQuotes()
    }
    
    public func getQuotes(by author: Author) -> [Quote] {
        let quotes = storage.getQuotes()
        return quotes.filter { $0.author == author }
    }
    
    public func getRandomQuote() -> Quote? {
        let quotes = storage.getQuotes()
        return quotes.randomElement()
    }
    
    public func getDistinctAuthors() -> [Author] {
        let quotes = storage.getQuotes()
        let authorSet = Set(quotes.compactMap { $0.author })
        return Array(authorSet)
    }
}

extension QuoteLibrary: CustomDebugStringConvertible {
    public var debugDescription: String {
        let quotes = storage.getQuotes()
        return "Quote library containing \(getQuoteString(for: quotes.count)) by \(getAuthorString(for: getDistinctAuthors().count))"
    }
    
    private func getQuoteString(for numberOfQuotes: Int) -> String {
        switch numberOfQuotes {
        case 0: return "no quotes"
        case 1: return "one qoute"
        default: return "\(numberOfQuotes) quotes"
        }
    }
    
    private func getAuthorString(for numberOfAuthors: Int) -> String {
        switch numberOfAuthors {
        case 0: return "no known authors"
        case 1: return "one author"
        default: return "\(numberOfAuthors) authors"
        }
    }
}
