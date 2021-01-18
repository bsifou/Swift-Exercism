import Foundation

struct Clock {
    private var inMinutes: Int
    //hhjh
    var minutes : Int { inMinutes % 60 }
    var hours : Int { inMinutes / 60 }

    init(hours: Int, minutes: Int) {
        inMinutes = (minutes + hours * 60).inMinutes
    }
    
    init(hours: Int) {
        self.init(hours: hours, minutes: 0)
    }
    
    func add(minutes: Int) -> Clock {
        Clock(hours: 0, minutes: inMinutes + minutes)
    }
    
    func subtract(minutes: Int) -> Clock {
        self.add(minutes: -minutes)
    }
}

extension Clock: Equatable {
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.description == rhs.description
    }
}


extension Clock: CustomStringConvertible {
    var description: String {
        String(format: "%02d:%02d", hours, minutes)
    }
}

extension Int {
    var inMinutes: Int {
        let maxMinutes = 24 * 60
        let r = self % maxMinutes
        return r < 0 ? r + maxMinutes : r
    }
}

