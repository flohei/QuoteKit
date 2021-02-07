public struct Quote {
    public let text: String
    public var author: Author?
    public var source: String?
    
    public init(_ text: String, author: Author? = nil, source: String? = nil) {
        self.text = text
        self.author = author
        self.source = source
    }
}

extension Quote: CustomStringConvertible {
    public var description: String {
        var result = "\"\(text)\"\n"
        if let author = author {
            result.append("— \(author)")
        } else {
            result.append("— unbekannt")
        }
        return result
    }
}

extension Quote: Equatable { }
