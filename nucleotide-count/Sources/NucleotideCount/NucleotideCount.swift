struct DNA {
    let strand: String
    
    func count(_ c: String) -> Int {
        counts()[c]!
    }
    
    init?(strand: String) {
        guard strand.allSatisfy({ ["A", "C", "G", "T"].contains($0) }) else {
            return nil
        }
        
        self.strand = strand
    }
    
    func counts() -> [String: Int] {
        strand.reduce(["T": 0, "A": 0, "C": 0, "G": 0]) {counts, c in
            var counts = counts
            counts[String(c)]? += 1
            return counts
        }

    }
}
