struct Hamming {
    static func compute(_ strand: String, against: String) -> Int? {
        guard strand.count == against.count else {
            return nil
        }
        
        return zip(strand, against).reduce(0) { (count, tuple) in count + (tuple.0 != tuple.1 ? 1 : 0) }
        
    }
    
    
}
