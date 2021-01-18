//Solution goes in Sources

struct PhoneNumber: CustomStringConvertible {
    var rawInput: String
    init(_ number: String) {
        rawInput = number
    }
    
    
    var number: String {        
        let output = rawInput.filter( { $0.isNumber })
        guard output.count == 10 || output.count == 11 && output.first == "1" else {
            return String(repeating: "0", count: 10)
        }
        return String(output.suffix(10))
        
    }
    
    
    var description: String {
        let i1 = number.index(number.startIndex, offsetBy: 3)
        let i2 = number.index(number.startIndex, offsetBy: 6)
        return  "(\(areaCode)) \(number[i1..<i2])-\(number[i2...])"
    }
    
    
    var areaCode: String {
        String(number.prefix(3))
    }
}
