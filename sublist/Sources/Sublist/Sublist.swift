enum Classification {
    case superlist, sublist, unequal, equal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classification {
    
    if listOne == listTwo {
        return Classification.equal
    } else if listOne.count < listTwo.count && listOne.isPartOf(listTwo) {
        return Classification.sublist
    } else if listTwo.count < listOne.count && listTwo.isPartOf(listOne) {
        return  Classification.superlist
    } else {
        return Classification.unequal
    }
    
}


extension Array where Element == Int {
    func isPartOf(_ bigList: [Int]) -> Bool {

        for i in 0...bigList.count - self.count {
            if Array(bigList[i..<i + self.count]) == self {
                return true
            }
        }
        
        return self.isEmpty
    }
}
