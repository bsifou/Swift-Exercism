import Foundation

extension String {
    static func randomASCII(from: Unicode.Scalar, to: Unicode.Scalar, length: Int = 1) -> String? {
        
        let _from = UInt8(ascii: from)
        let _to   = UInt8(ascii: to)
        
        let tmp = (0..<length).map { _ in UInt8.random(in: _from..._to) }
        return String(bytes: tmp, encoding: String.Encoding.ascii)!
    }
}

//print(UInt8(ascii: "65"))

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}


protocol Book {
    associatedtype Page
    var pages: [Page] { get }
    var pagesCount: Int { get }
}

//var eastOfEadenBook = Book(pages: ["Intro", "Par I"], pagesCount: 2)

struct BookStruct: Book {
    typealias Page = String
    var pages: [Page]
    var pagesCount: Int
}
//
struct Novel<B: Book>: Book where B.Page == Int {
//    typealias Page = B.Page
    var pages: [B.Page]
    var pagesCount: Int
}

//let eastOfEaden = Novel<BookStruct>(pages: ["Intro", "Par I"], pagesCount: 2)
print(SIMD.Scalar)



extension SIMD where Self.Scalar: FloatingPoint {
    static func dot(_ a: Self, _ b: Self) -> Scalar {
        (a * b).sum()
    }
    
    var length: Scalar {
        Self.dot(self, self).squareRoot()
    }
    
    func distance(to other: Self) -> Scalar {
        (self - other).length
    }
}


//
//
//var stack = IntStack()
//stack.push(5)
//print(stack)
//
////print(String.randomASCII(from: "A", to: "Z", length: 2)!)
