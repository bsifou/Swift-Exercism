func makeDiamond(letter: Character) -> [String] {
    let topHalfCount = letter.asciiValue!  - Character("A").asciiValue!
    let width = Int(topHalfCount * 2 + 1)
    let topHalf = (letter.asciiValue! - topHalfCount...letter.asciiValue!)
        .enumerated()
        .reduce([]) { r, letterRow in
            r + [make(row: letterRow.offset, of: Character(Unicode.Scalar(letterRow.element)), width: width)]
        }
    return topHalf + topHalf.dropLast().reversed()
}

fileprivate func make(row: Int, of letter: Character, width: Int) -> String {
    let filler: Character = " "
    let edgesCount = Int((width - 1) / 2) - row
    let edgeSpaces = String(repeating: filler, count: edgesCount)

    if row == 0 {
        return "\(edgeSpaces)\(letter)\(edgeSpaces)"
    } else {
        let middleSpaces = String(repeating: filler, count: width - (edgesCount * 2 + 2))
        return "\(edgeSpaces)\(letter)\(middleSpaces)\(letter)\(edgeSpaces)"
    }
}

func makeDiamond(letter: String) -> [String] {
    let letterA: Unicode.Scalar = "A"
    let letterInput = Unicode.Scalar(letter)
    let size = letterInput!.value - letterA.value
    var result: [String] = []
    let sideTemplate = Array(repeating: " ", count: Int(size))
    for i in 0...size {
        let letter = String(UnicodeScalar(letterA.value + i)!)
        var side = sideTemplate
        side.insert(letter, at: Int(i))
        result.append((side.reversed().dropLast() + side).joined())
    }
    result += result.reversed().dropFirst()
    return result
}
