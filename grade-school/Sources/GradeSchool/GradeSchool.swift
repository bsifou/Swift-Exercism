struct GradeSchool {
    private var school: [Int: [String]] = [:]
    
    mutating func addStudent(_ newStudent: String, grade: Int) {
        school[grade, default: []].append(newStudent)
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        school[grade, default: []]
    }
    
    var roster: [Int: [String]] {
        school
    }
    
    var sortedRoster: [Int: [String]] {
        school.mapValues { $0.sorted() }
    }
}
