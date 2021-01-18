//Solution goes in Sources

struct Squares {
    let n: Int
    init(_ n: Int) {
        self.n = n
    }
    
    var squareOfSum: Int {
        var sumOfSquares = 0
        for i in 1...n {
            sumOfSquares += i
        }
        
        return sumOfSquares * sumOfSquares
    }
    
    var sumOfSquares: Int {
        var squareOfSum = 0
        for i in 1...n {
            squareOfSum += i * i
        }
        return squareOfSum
    }
    
    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
}
