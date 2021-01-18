//Solution goes in Sources

struct WordCount {
    let words: String
    func count() -> [String: Int] {
        words.split(separator: " ")
            .reduce(into: [:]) { count, word in
                if let w = word.wordifying() {
                    count[w, default: 0] += 1
                }

            }
    }
}

extension Substring {
    func wordifying() -> String? {
        let filtered =  self.filter({ $0.isLetter || $0.isNumber })
        guard !filtered.isEmpty else {
            return nil
        }
        
        return filtered.lowercased()
    }
}
