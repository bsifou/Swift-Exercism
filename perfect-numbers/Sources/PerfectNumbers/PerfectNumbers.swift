//Solution goes in Sources

struct NumberClassifier {
    var number: Int
    
    enum Category {
        case perfect, abundant, deficient
    }
    
    var classification: Category {
        switch number.factors().reduce(0, +) {
        case number: return Category.perfect
        case 0..<number: return Category.deficient
        default: return Category.abundant
   
        }        
    }

}

extension Int {
    func factors() -> [Int] {
        (1...self / 2).filter({ self % $0 == 0})
    }
}
