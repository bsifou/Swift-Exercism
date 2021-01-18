import Foundation
struct Grains {
    static func square(_ value: Int) throws -> Double {
        let error = "Input[%d] invalid. Input should be between 1 and 64 (inclusive)"
        
        guard value > 0 else  {
            throw GrainsError.inputTooLow(String(format: error, value))
        }
        
        guard case 1...64 = value  else {
            throw GrainsError.inputTooHigh(String(format: error, value))
        }
                        
        
      return Double(truncating: pow(2, value - 1 ) as NSNumber)

    }
    
    static var total: Double {
        Double(truncating: pow(2, 64) - 1 as NSNumber)
        
    }
    
    
    
    enum GrainsError: Error {
        case inputTooHigh(_ message: String)
        case inputTooLow(_ message: String)
    }
}
