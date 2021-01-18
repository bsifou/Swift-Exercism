struct Allergies: OptionSet {
    let rawValue: UInt
    
    static let one    = Allergies(rawValue: 1)
    static let four   = Allergies(rawValue: 4)
    static let eight  = Allergies(rawValue: 8)

}
extension Allergies {
    init(_ score: UInt) {
        self.init(rawValue: score)
    }
    
    func hasAllergy(_ allergies: Allergies) -> Bool {
        return self.contains(allergies)
    }
}
print(Allergies(12).contains(.four))
print(7 + 4 + 1)




