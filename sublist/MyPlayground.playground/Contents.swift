//Solution goes in Sources

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
        guard !self.isEmpty else {
            return true
        }
        
        let i1 = bigList.firstIndex(of: self.first!) ?? 0
        let i2 = bigList.lastIndex(of: self.last!) ?? self.count - 1
        
        //        return self.allSatisfy( { bigList.contains($0) })
        
        return self == Array(bigList[i1...i2])
    }
}

// [1, 3], listTwo: [1, 2, 3])

// print([1, 3].isPartOf([1, 2, 3]))


print([1, 3].isPartOf([1, 2, 3]))
print(classifier(listOne: [1, 3], listTwo: [1, 2, 3]))
