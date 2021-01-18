struct IsbnVerifier {
    static func isValid(_ sequence: String) -> Bool {
        let numbers = sequence
            .filter { $0.isNumber || $0 == "X" }
            .enumerated()
            .compactMap { pair in pair.element == "X" && pair.offset >= 9 ? 10 : Int(String(pair.element)) }

        guard numbers.count == 10 else {
            return false
        }
        
        return zip((1...10).reversed(), numbers)
            .map( { $0.0 * $0.1 } ).reduce(0, +) % 11 == 0
    }
}
