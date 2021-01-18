//Solution goes in Sources
import Foundation

struct Queens {
    var white: [Int]
    var black: [Int]
    
    enum InitError: Error {
        case sameSpace, invalidCoordinates, incorrectNumberOfCoordinates
    }
    
    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        switch (white, black) {
        case let (white, black) where black == white:
            throw InitError.sameSpace
        case let (white, black) where black.isInvalidCoordinates() || white.isInvalidCoordinates():
            throw InitError.invalidCoordinates
        case let (white, black) where white.count != 2 || black.count != 2:
            throw InitError.incorrectNumberOfCoordinates
        default:
            self.white = white
            self.black = black
        }
    }
    
    
    var description: String {
        let size = 8
        var board = Array(repeating: Array(repeating: "_", count: size), count: size)
        board[white.x][white.y] = "W"
        board[black.x][black.y] = "B"
        return board.map { row in row.joined(separator: " ") }.joined(separator: "\n")

    }
    
    
    var canAttack: Bool {
        white.x == black.x ||
            white.y == black.y ||
            abs(black.x - white.x) == abs(black.y - white.y)
        
    }
    
}

extension Array where Element == Int {
    func isInvalidCoordinates() -> Bool {
        self.contains(where: ({ $0 < 0}))
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
