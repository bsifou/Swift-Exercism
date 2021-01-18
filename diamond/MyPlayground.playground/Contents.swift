let letterA: Unicode.Scalar = "A"
let letterInput = Unicode.Scalar("C")
let size = letterInput.value - letterA.value
print(Array(repeating: ".", count: Int(size)))
    
