struct Allergies: OptionSet {
    let rawValue: UInt
    
    static let eggs         = Allergies(rawValue: 1)
    static let peanuts      = Allergies(rawValue: 1 << 1)
    static let shellfish    = Allergies(rawValue: 1 << 2)
    static let strawberries = Allergies(rawValue: 1 << 3)
    static let tomatoes     = Allergies(rawValue: 1 << 4)
    static let chocolate    = Allergies(rawValue: 1 << 5)
    static let pollen       = Allergies(rawValue: 1 << 6)
    static let cats         = Allergies(rawValue: 1 << 7)
}

extension Allergies {
    init(_ score: UInt) {
        self.init(rawValue: score)
    }
    
    func hasAllergy(_ allergies: Allergies) -> Bool {
        return self.contains(allergies)
    }
}



