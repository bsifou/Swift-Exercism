extension String {
    var isUpperCased: Bool {
        let letters = self.filter({ $0.isLetter })
        return letters.allSatisfy({ $0.isUppercase }) && !letters.isEmpty
    }
    
    var isAllSpaces: Bool {
        self.allSatisfy({ $0.isWhitespace } )
    }
}

struct Bob {
    static func hey(_ input: String) -> String {
        if  input.isUpperCased {
            return "Whoa, chill out!"
        } else if input.hasSuffix("?") {
            return "Sure."
        } else if input.isAllSpaces {
            return "Fine. Be that way!"
        }  else {
            return "Whatever."
        }
    }
}

