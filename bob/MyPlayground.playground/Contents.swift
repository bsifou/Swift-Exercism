print("1, 2, 3.".filter({ $0.isLetter }).isEmpty)

extension String {
    var isUpperCased: Bool {
        let r = self.filter({ $0.isLetter })
        print("r: \(r)")
        return r.allSatisfy({ $0.isUppercase }) && !r.isEmpty
    }
}

print("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!".isUpperCased)
print("ZOMGTHEZOMBIESARECOMING".allSatisfy({ $0.isUppercase }))
