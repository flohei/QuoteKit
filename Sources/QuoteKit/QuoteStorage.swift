public protocol QuoteStorage {
    func add(_ quote: Quote)
    func delete(_ quote: Quote)
    func getQuotes() -> [Quote]
}
