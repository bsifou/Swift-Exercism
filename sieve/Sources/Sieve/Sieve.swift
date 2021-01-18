//Solution goes in Sources

struct Sieve {
    let limit: Int
    
    init(_ limit: Int) {
        self.limit = limit
    }
    
    var primes: [Int] {
        var primes = Array(repeating: true, count: limit - 2)
        for (index1, isPrime) in primes.enumerated() {
            let number1 = index1 + 2
            if isPrime {
                for index2 in index1 + 1..<limit - 2 {
                    let number2 = index2 + 2
                    if number2 % number1 == 0 {
                        primes[index2] = false
                    }
                }
            }
        }
        
        return primes.enumerated().filter( { $0.1 }).map({ $0.0 + 2})
        
    }
    
    
    
}
