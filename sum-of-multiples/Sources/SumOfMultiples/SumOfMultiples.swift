extension Int {
    public func isMultiple(of other: Int) -> Bool {
        return self % other == 0
    }
}

struct SumOfMultiples {
    static func toLimit(_ n: Int, inMultiples: [Int]) -> Int {
            (0..<n)
            .filter { n in
                inMultiples.contains { x in
                  x != 0 && n.isMultiple(of: x)
                }
                
            }
            .reduce(0, +)

    }
}



