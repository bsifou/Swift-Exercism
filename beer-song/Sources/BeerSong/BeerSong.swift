struct BeerSong {
    let numberOfBeerBottles: Int
    
    private func bottleOfBeer(_ n: Int) -> String {
        switch n {
        case 0: return "no more bottles"
        case 1: return "1 bottle"
        default: return "\(n) bottles"
        }
    }
    
    let end = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
    func generateVersesOfBeerSong() -> String {
        
        guard numberOfBeerBottles >= 1 else {
            return end
        }
        
        return (1...numberOfBeerBottles).reduce(into: [end]) { r, n in
            r.append("\(bottleOfBeer(n)) of beer on the wall, \(bottleOfBeer(n)) of beer.\nTake one down and pass it around, \(bottleOfBeer(n - 1)) of beer on the wall.")
        }.reversed().joined(separator: "\n\n")
        
    }
}
