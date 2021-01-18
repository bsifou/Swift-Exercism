
struct PhoneNumber : CustomStringConvertible {
    var number = "0000000000"
    
    var areaCode : String {
        "\(number.prefix(3))"
    }
    
    var description: String {
        let i1 = number.index(number.startIndex, offsetBy: 3)
        let i2 = number.index(number.startIndex, offsetBy: 6)
        
        return "(\(areaCode)) \(number[i1..<i2] )-\(number[i2...])"
    }
    
    init(_ raw: String) {
        let numberStr = raw.filter { $0.isNumber }
        guard numberStr.count == 10 || (numberStr.count == 11 && numberStr.first == "1") else {
            return
        }
        number = String(numberStr.suffix(10))
    }
}



