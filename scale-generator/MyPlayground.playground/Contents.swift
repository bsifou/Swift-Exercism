extension String {
    func firstCharCapitalized() -> String {
        guard self.count > 0 else {
            return self
        }
        
        return self.first!.uppercased() + self[self.index(after: self.startIndex)...].lowercased()
    }
}

struct ScaleGenerator {
    var name :String {
        "\(tonic.firstCharCapitalized()) \(scaleName)"
    }
    
    let tonic : String
    let scaleName : String
    var pattern : [Int] = []
    
    private static let chromatic_shape = ["c", "c#", "d", "d#", "e", "f", "f#", "g", "g#", "a", "a#", "b"]
    private static let chromatic_flat  = ["c", "db", "d", "eb", "e", "f", "gb", "g", "ab", "a", "bb", "b"]
    
    
    init(tonic: String, scaleName: String = "chromatic", pattern: String = "mmmmmmmmmmmm") {
        self.scaleName = scaleName.lowercased()
        self.tonic = tonic.lowercased()
        
        for c in pattern {
            switch c {
            case "M":
                self.pattern.append(2)
            case "m":
                self.pattern.append(1)
            case "A":
                self.pattern.append(3)
            default:
                break
            }
        }
    }
    
    func pitches() -> [String] {
        var scale = ScaleGenerator.chromatic_shape
        
        if tonic == "f"
            || (tonic.count == 2 && tonic.last! == "b")
            || scaleName.hasPrefix("locrian")
            || scaleName.hasPrefix("harmonic") {
            scale = ScaleGenerator.chromatic_flat
        }
        
        var offset :Int = scale.firstIndex(of: tonic)!
        
        return pattern.map { step in
            let idx = offset
            offset = (offset + step) % 12
            return scale[idx].firstCharCapitalized()
        }
    }
}
