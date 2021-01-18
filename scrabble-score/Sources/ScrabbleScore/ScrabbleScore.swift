//Solution goes in Sources

struct Scrabble {
    fileprivate let word: String?
    private var db = [String: Int]()
    fileprivate func value(for letter: Character) -> Int {
        //        switch letter {
        //        case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T": return 1
        //        case "D", "G": return 2
        //        case "B", "C", "M", "P": return 3
        //        case "F", "H", "V", "W", "Y": return 4
        //        case "K": return 5
        //        case "J", "X": return 8
        //        case "Q", "Z": return 10
        //        default: return 0
        //        }
        
        db[letter.uppercased(), default: 0]
    }
    
    
    init(_ word: String?) {
        self.word = word?.uppercased()
        let rawScores =
            """
            A E I O U L N R S T       1
            D G                       2
            B C M P                   3
            F H V W Y                 4
            K                         5
            J X                       8
            Q Z                       10
            """
        rawScores.split(separator: "\n").forEach {
            let line = $0.split(separator: " ")
            let scoreIdx = line.count - 1
            let score = Int(line[scoreIdx], radix: 10)
            
            line[..<scoreIdx].forEach {
                db[String($0)] = score
            }
        }
    }
    
    var score: Int {
        word?.map { value(for: $0) }
            .reduce(0, +) ?? 0
        
    }
    
    static func score(_ word: String) -> Int {
        Scrabble(word).score
    }
    
}

