struct SimulatedRobot {
    
    var bearing: Orientation = .east
    var coordinates: [Int] = [0, 0]
    
    mutating func orient(_ direction: Orientation)  {
        bearing = direction
    }
    
    private let orientations: [Orientation] = [.north, .east, .south, .west]
    
    mutating func turnRight() {
        bearing = Orientation(rawValue: (bearing.rawValue + 1 + 4) % 4)!
    }
    
    mutating func turnLeft() {
        bearing = Orientation(rawValue: (bearing.rawValue - 1 + 4) % 4)!
    }
    
    mutating func at(x: Int, y: Int) {
        coordinates = [x, y]
    }
    
    mutating func advance() {
        switch bearing {
        case .north: coordinates[1] += 1
        case .south: coordinates[1] -= 1
        case .west: coordinates[0] -= 1
        case .east: coordinates[0] += 1
        }
    }
    
    func instructions(_ sequence: String) -> [Instruction] {
        sequence.map( { Instruction(rawValue: $0)! } )
    }
    
    mutating func place(x: Int, y: Int, direction: Orientation) {
        coordinates = [x, y]
        bearing = direction
    }
    
    mutating func evaluate(_ sequence: String) {
        for instruction in instructions(sequence) {
            switch instruction {
            case .turnRight: turnRight()
            case .turnLeft: turnLeft()
            case .advance: advance()
            }
        }
    }
}

extension Array where Element == Int {
    var x: Int {
        self[0]
    }
    
    var y: Int {
        self[1]
    }
}

enum Orientation: Int {
    case north = 0, east = 1, south = 2, west = 3
}

enum Instruction: Character {
    case turnRight = "R", advance = "A", turnLeft = "L"
}
