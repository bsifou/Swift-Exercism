let factorMap = [
    3: "Pling",
    5: "Plang",
    7: "Plong",
]


let special = factorMap.reduce("") { (acc, pair) in
//    if number > 0 && number % pair.0 == 0 {
//        return acc + pair.1
//    }
    print(pair.0)
    print(pair.key)
    return ""
}
print(special)

