//Solution goes in Sources
extension Array {
    func keep(_ predicate: (Element) -> Bool) -> [Element] {
        self.compactMap( { predicate($0) ? $0 : nil })
    }
    
    func discard(_ isToDiscard: (Element) -> Bool) -> [Element] {
        keep { !isToDiscard($0) }
    }
    
    
}
