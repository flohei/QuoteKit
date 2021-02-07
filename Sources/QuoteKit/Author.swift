public struct Author {
    public let name: String
    
    public init(_ name: String) {
        self.name = name
    }
}

extension Author: CustomStringConvertible {
    public var description: String {
        return name
    }
}

extension Author: Equatable { }
extension Author: Hashable { }
