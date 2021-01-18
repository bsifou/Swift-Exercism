import Foundation
struct Squares {
    let n: Int
    init(_ n: Int) {
        self.n = n
    }
    
    var squareOfSum: Int {
        let x =  (1...n).reduce(0, +)
        return x * x
    }
    
    var sumOfSquares: Int {
        (1...n).reduce(0) { sum, n in
            sum + n * n
        }
    }
    
    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
        
    }
}

print("\(type(of: 10.0)) \(type(of: 10))")
print(12.0 / 2)
