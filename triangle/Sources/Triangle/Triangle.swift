struct Triangle {
    let sides: (Double, Double, Double)
    
    let triangleKind = (Equilateral:"Equilateral", Isosceles:"Isosceles", Scalene:"Scalene", ErrorKind:"ErrorKind")
    
    fileprivate var isValide: Bool {
        return sides.0 + sides.1 + sides.2 > 0 && sides.0 + sides.1 > sides.2 && sides.1 + sides.2 > sides.0
    }
    
    fileprivate var allSidesEqual: Bool {
        sides.0 == sides.1 || sides.1 == sides.2 || sides.0 == sides.2
    }
    
    var kind: String {
        guard isValide else {
            return triangleKind.ErrorKind
        }
        
        if sides.0 == sides.1 && sides.0 == sides.2 {
            return triangleKind.Equilateral
        } else if allSidesEqual {
            return triangleKind.Isosceles
        } else {
            return triangleKind.Scalene
        }
    }
    
    init(_ side1: Double, _ side2: Double, _ side3: Double) {
        self.sides = (side1, side2, side3)
    }
    
}

