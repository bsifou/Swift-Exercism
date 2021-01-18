struct Raindrops {
    let sounds: String
    
    init(_ number: Int) {
        var output = ""
        
        if number.hasFactor(3) {
            output += "Pling"
        }
        if number.hasFactor(5) {
            output += "Plang"
        }
        if number.hasFactor(7) {
            output += "Plong"
        }
        
        sounds =  output.isEmpty ? String(number) : output
    }
}

extension Int {
    func hasFactor(_ n: Int) -> Bool {
        self % n == 0
    }
}

