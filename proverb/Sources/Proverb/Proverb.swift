//Solution goes in Sources

import Foundation

extension Array {
    func recite() -> String {
        var output = ""
        for (wanta, losta) in zip(self, self.dropFirst()) {
            output += "For want of a \(wanta) the \(losta) was lost.\n"
        }
        if self.count >= 1 {
            output += "And all for the want of a \(self[0])."
        }
        
        return output
    }
}
