//Solution goes in Sources
import Foundation

struct Gigasecond {
   
    let description: String
    
    init?(from dateStr: String) {
        let RFC3339DateFormatter = DateFormatter()
//         RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date1 = RFC3339DateFormatter.date(from: dateStr) else {
            return nil
        }
        
                
        let date2 = Date(timeInterval: 1_000_000_000, since: date1)
        // let date2 = date1.addingTimeInterval(_:1_000_000_000)

        description = RFC3339DateFormatter.string(from: date2)
        
    }
}


