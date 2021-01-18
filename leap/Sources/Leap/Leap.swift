//Solution goes in Sources

struct Year {
    let calendarYear: Int
}

extension Int {
    func isDivisible(by devisor: Int) -> Bool {
        self % devisor == 0
    }
}

extension Year {
    var isLeapYear: Bool {
        calendarYear.isDivisible(by: 4) && !calendarYear.isDivisible(by: 100) || calendarYear.isDivisible(by: 400) && calendarYear.isDivisible(by: 100)
    }
}


