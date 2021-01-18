struct Isogram {
    static func isIsogram(_ string: String) -> Bool {
        var letters = Set<String>()
        return string.allSatisfy { !$0.isLetter ||  (true, $0.lowercased()) == letters.insert($0.lowercased()) }
    }
}
