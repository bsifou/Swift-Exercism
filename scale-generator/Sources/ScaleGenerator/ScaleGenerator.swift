
struct ScaleGenerator {
    var name: String {
        "\(tonic.tonicify()) \(scaleName)"
    }
    
    let tonic: String
    let scaleName: String
    var pattern: String
    
    fileprivate let sharp = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    fileprivate let flat = ["A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab"]
    
    init(
        tonic: String, scaleName: String = "chromatic",
        pattern: String = String(repeating: "m", count: 12)
    ) {
        self.scaleName = scaleName.lowercased()
        self.tonic = tonic
        self.pattern = pattern
    }
    
    func pitches(a: Int = 0, b: Int = 2) -> [String] {
        
        let notes = tonic.isFlatKey ? flat : sharp
        
        guard let tonicIndex = notes.firstIndex(of: tonic.tonicify()) else { return notes }
        
        let pitches = Array(notes[tonicIndex...] + notes[0..<tonicIndex])
        var index = 0
        let keyToStep: [Character: Int] = ["m": 1, "M": 2, "A": 3]
        
        return
            pattern
            .map({ keyToStep[$0]! })
            .reduce(into: []) { scale, step in
                scale.append(pitches[index].tonicify())
                index += step
            }
    }
    
}


extension String {
    func tonicify() -> String {
        if self.count == 2 {
            return self.prefix(1).uppercased() + self.suffix(1)
        }
        
        return self.uppercased()
    }
}

extension String {
    var isFlatKey: Bool {
        ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"].contains(self)
    }
}
