func flattenArray<T>(_ a: [Any?]) -> [T] {
    a.reduce([]) {r, e in
        switch e {
        case let x as T:
            return r + [x]
        case nil:
            return r
        default:
            return r + flattenArray(e as! [Any?])
        }
        
    }
}

