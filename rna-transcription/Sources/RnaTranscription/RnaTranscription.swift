//Solution goes in Sources


//G -> C
//C -> G
//T -> A
//A -> U

struct Nucleotide {
    let sequence: String
    init(_ sequence: String) {
        self.sequence = sequence
    }
    
    func complementOfDNA() throws -> String {
        let translation: [Character: Character] = ["G": "C",
                                                   "C": "G",
                                                   "T": "A",
                                                   "A": "U"]
        
        
        return String(try sequence.map { c in
            guard let r = translation[c] else {
                throw TranscriptionError.invalidNucleotide(message: "\(c) is not a valid Nucleotide")
            }
            return r
        })
    }
}

enum TranscriptionError: Error {
    case invalidNucleotide(message: String)
}
