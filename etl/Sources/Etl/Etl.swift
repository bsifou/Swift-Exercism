struct ETL {
    static func transform(_ input: [Int: [String]]) -> [String: Int] {
        var output: [String: Int] = [:]
        for (point, letters) in input {
            for letter in letters {
                output[letter.lowercased()] = point
            }
        }
        return output
    }
}
