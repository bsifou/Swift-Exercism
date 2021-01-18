import Foundation

//print("hello")

let words = ["one", "two", "three", "four"]
let numbers = 1...4

for (word, number) in zip(words, numbers.dropFirst()) {
    print("\(word): \(number)")
}


