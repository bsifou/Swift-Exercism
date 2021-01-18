//Solution goes in Sources
import Foundation

struct Garden {
    var rows: [String]
    var children: [String]
    static let defaultChildren: [String] = {
        """
        Alice, Bob, Charlie, David,
        Eve, Fred, Ginny, Harriet,
        Ileana, Joseph, Kincaid, Larry
        """
            .split(separator: "\n")
            .flatMap({ $0.split(separator: ",") })
            .map({ String($0.trimmingCharacters(in: .whitespaces)) })
    }()
    
    init(_ diagram: String, children: [String] = defaultChildren) {
        
        // TODO: switch to substring
        
        self.rows = diagram.split(separator: "\n").map(String.init)
        self.children = children
        
    }
    
    func plantsForChild(_ child: String) -> [Plant] {
        let childIndex = children.sorted().firstIndex(of: child)!
        return (0...1).flatMap({ plantsFor(childIndex, row: $0) })
    }
    
    func plantsFor(_ i: Int, row: Int) -> [Plant] {
        let row = rows[row].map(Character.init)
        return row[i * 2...i * 2 + 1].compactMap { Plant(rawValue: $0) }

    }
    
    enum Plant: Character {
        case violets = "V", radishes = "R", clover = "C", grass = "G"
    }
    
}
