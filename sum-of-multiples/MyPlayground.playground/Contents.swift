//Solution goes in Sources
// SumOfMultiples.toLimit(1, inMultiples: [3, 5])

extension Int {
    public func isMultiple(of other: Int) -> Bool {
        return (self % other) == 0
    }
}


struct SumOfMultiples {
    static func toLimit(_ n: Int, isMultiples: [Int]) -> Int {
        let r = [0..<n].filter { n in
            isMultiples.reduce(true) { r, x in
                r && x.isMultiple(of: n)
            }
        }
        return 1
    }
}



