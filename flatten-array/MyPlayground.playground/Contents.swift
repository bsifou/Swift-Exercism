import Foundation

func flattenArray(_ a: [Any?]) -> [Any] {
    a.reduce([]) {r, e in
        switch e {
        case let x as Int:
            return r + [x]
        case nil:
            return r
        default:
            return r + flattenArray(e as! [Any?])
        }
        
    }
}


print(flattenArray([1, 4, [5, 10], 10]))
