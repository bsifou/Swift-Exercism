import UIKit

var dateStr = "1959-07-19T00:00:00"

struct Gigasecond {
    var RFC3339DateFormatter: DateFormatter
    let date: Date
    
    var description: String {
        RFC3339DateFormatter.string(from: date)
    }

    init?(from: String) {
        RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = RFC3339DateFormatter.date(from: dateStr)

        guard date != nil else {
            return nil
        }
        
        self.date = Date(timeInterval: pow(10, 9), since: date!)
        
    }
}

var x: Int?
print(type(of: x = 1) == type(of: ()) == Void.self)
