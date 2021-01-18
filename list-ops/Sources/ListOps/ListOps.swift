struct ListOps {
    static func append<T>(_ l1: [T], _ l2: [T]) -> [T] {
       return l1 + l2
    }
    
    static func concat<T>(_ arrays: [T]...) -> [T] {
        var r = [T]()
        for array in arrays {
            r = append(r, array)
        }
        return r
    }
    
    static func filter<T>(_ array: [T], _ predicate: (T) -> Bool) -> [T] {
        var r = [T]()
        for c in array {
            if predicate(c) {
                r = append(r, [c])
            }
        }
        return r
    }
        
    
    static func length<T>(_ array: [T]) -> Int {
        var r = 0
        for _ in array {
            r += 1
        }
        
        return r
    }
    
    static func map<T, R>(_ array: [T], _ f: (T) -> R) -> [R] {
        var r = [R]()
        for c in array {
            r = append(r, [f(c)])
        }
        
        return r
    }
    
       
    static func foldLeft<T, R>(_ array: [T],  accumulated: R, combine: (R, T) -> R) -> R {
        var r = accumulated
        for c in array {
            r = combine(r, c)
        }
        
        return r
    }
    
    static func foldRight<T, R>(_ array: [T],  accumulated: R, combine: (T, R) -> R) -> R {
        var r = accumulated
        for c in reverse(array) {
            r = combine(c, r)
        }
        
        return r
    }
    
    static func reverse<T>(_ array: [T]) -> [T] {
        var r = [T]()
        let l = length(array)
        for i in 0..<l {
            r = append(r, [array[l-i-1]])
        }
        
        return r
    }
    
}

