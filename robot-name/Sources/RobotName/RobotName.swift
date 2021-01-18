//Solution goes in Sources
struct Robot {
    
    fileprivate var _name: String
    
    static func randomCharacter() -> Character {
        Character(Unicode.Scalar(Int.random(in: 65...90))!)
    }
    
    static func randomNumber() -> Int {
        Int.random(in: 1...9)
    }
    
    static func randomString() -> String {
        var randomString = ""
        
        (0..<5).map { _ in  }
        for _ in 1...3 {
            randomString += String(randomNumber())
        }
        return randomString
        
    }
    
    static func random2Characters() -> String {
        "\(randomCharacter())\(randomCharacter())"
    }
    
    var name: String {
        _name
    }
    
    init() {
        _name = "\(Robot.random2Characters())\(Robot.random3Numbers())"
    }
    
    mutating func resetName() {
        _name = "\(Robot.random2Characters())\(Robot.random3Numbers())"
    }
}
