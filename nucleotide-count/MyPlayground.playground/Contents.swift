struct DNA {
    let strand: String
    
    func count(_ string: String) -> Int {
        return 1
    }
    
    init?(strand: String) {
        guard strand.allSatisfy({ ["A", "C", "G","T"].contains($0) }) else {
            return nil
        }
        
        self.strand = strand
    }
    
    func counts() -> [Character: Int] {
        //        return strand.reduce([:]) {counts, c in
        //            var counts = counts
        //            counts[c] = (counts[c] ?? 0) + 1
        //            return counts
        //        }
        var counts: [Character: Int] =  ["T": 0, "A": 0, "C": 0, "G": 0]
        for c in strand {
            counts[c] = counts[c]! + 1
        }
        
        return counts
    }
    
    
}

