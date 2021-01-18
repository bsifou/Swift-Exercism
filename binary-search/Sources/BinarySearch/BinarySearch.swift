//Solution goes in Sources

struct BinarySearch<T> where T: Comparable  {
    var list: [T] = []
    
    init(_ list: [T]) throws {
        guard list.isSorted else {
            throw  BinarySearchError.unsorted
        }

        self.list = list
    }
    
    func searchFor(_ key: T, range: Range<Int>) -> Int? {
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        if list[midIndex] > key {
            return searchFor(key, range: range.lowerBound..<midIndex)
            
            // Is the search key in the right half?
        } else if list[midIndex] < key {
            return searchFor(key, range: (midIndex + 1)..<range.upperBound)
        } else {
            return midIndex
        }
    }
        
    func searchFor(_ key: T) -> Int? {
         searchFor(key, range: 0..<list.count)
    }
    
    var middle: Int {
        list.middle
    }
}

enum BinarySearchError: Error {
    case unsorted
}

extension Array where Element: Comparable {
    var middle: Int {
        self.count / 2
    }
    
    var isSorted: Bool {
         zip(self, self.dropFirst()).allSatisfy(<=)
    }
}


