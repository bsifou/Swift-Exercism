enum ChristmasSongError: Error {
    case notChristmasError
}

struct TwelveDaysSong {
    private static let dayGift = [1: "Partridge in a Pear Tree",
                                  2: "two Turtle Doves",
                                  3: "three French Hens",
                                  4: "four Calling Birds",
                                  5: "five Gold Rings",
                                  6: "six Geese-a-Laying",
                                  7: "seven Swans-a-Swimming",
                                  8: "eight Maids-a-Milking",
                                  9: "nine Ladies Dancing",
                                  10: "ten Lords-a-Leaping",
                                  11: "eleven Pipers Piping",
                                  12: "twelve Drummers Drumming"]
    
    private static let days = [1: "first",
                               2: "second",
                               3: "third",
                               4: "fourth",
                               5: "fifth",
                               6: "sixth",
                               7: "seventh",
                               8: "eighth",
                               9: "ninth",
                               10: "tenth",
                               11: "eleventh",
                               12: "twelfth"]
    
    
    
    static func verse(_ n: Int) -> String {
        var output = "On the \(days[n]!) day of Christmas my true love gave to me: "
        guard n > 1 else {
            return output + "a " + dayGift[1]! + "."
        }
        for i  in stride(from: n, through: 1, by: -1) {
            let gift = dayGift[i]!
            if i > 1 {
                output += gift + ", "
            } else {
                output += "and a " + gift + "."
            }
        }
        
        return output
        
    }
    
    static func sing() -> String {
        verses(1, 12)
    }
    
    static func verses(_ from: Int, _ to: Int) -> String {
        (from...to).map({ verse($0) }).joined(separator: "\n")
    }
    
    
    
}

extension Array where Element == String {
    func andJoined() -> String {
        switch self.count {
        case 0:
            return ""
        case 1:
            return self.first!
        default:
            let idx = index(before: endIndex)
            
            return self[..<idx].joined(separator: ", ") + ", and \(self.last!)"
        }
    }
}

struct ChristmasDay {
    let day : Int
    
    init(day: Int) throws {
        guard day < 13 && day > 0 else {
            throw ChristmasSongError.notChristmasError
        }
        self.day = day
    }
    
    func ordinal() -> String {
        switch day {
        case  1 : return "first"
        case  2 : return "second"
        case  3 : return "third"
        case  4 : return "fourth"
        case  5 : return "fifth"
        case  6 : return "sixth"
        case  7 : return "seventh"
        case  8 : return "eighth"
        case  9 : return "ninth"
        case 10 : return "tenth"
        case 11 : return "eleventh"
        case 12 : return "twelfth"
        default:  return "unknown"
        }
    }
    
    func gifts() -> [String] {
        let allGifts = [
            "a Partridge in a Pear Tree",
            "two Turtle Doves",
            "three French Hens",
            "four Calling Birds",
            "five Gold Rings",
            "six Geese-a-Laying",
            "seven Swans-a-Swimming",
            "eight Maids-a-Milking",
            "nine Ladies Dancing",
            "ten Lords-a-Leaping",
            "eleven Pipers Piping",
            "twelve Drummers Drumming"
        ]
        
        return Array(allGifts[..<day].reversed())
    }
}

struct TwelveDaysSong {
    static func verse(_ i: Int) -> String {
        let day = try! ChristmasDay(day: i)
        
        return "On the \(day.ordinal()) day of Christmas my true love gave to me: \(day.gifts().andJoined())."
    }
    
    static func sing() -> String {
        return verses(1, 12)
    }
    
    static func verses(_ from: Int, _ to: Int) -> String {
        (from...to).map { TwelveDaysSong.verse($0) }.joined(separator: "\n")
    }
}
