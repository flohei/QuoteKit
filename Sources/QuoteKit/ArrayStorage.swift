open class ArrayStorage: QuoteStorage {
    private var quotes = [Quote]()
    
    public init() { }
    
    public func add(_ quote: Quote) {
        quotes.append(quote)
    }
    
    public func delete(_ quote: Quote) {
        guard let index = quotes.firstIndex(where: { $0 == quote }) else { return }
        quotes.remove(at: index)
    }
    
    public func getQuotes() -> [Quote] {
        return quotes
    }
}
