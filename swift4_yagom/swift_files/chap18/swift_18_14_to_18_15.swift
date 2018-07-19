import Swift

// 코드 18-14 편의 이니셜라이저 자동 상속 2
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknwon")
    }
}

class Student: Person {
    var major: String

    convenience init(major: String) {
        self.init()
        self.major = major
    }
    
    override convenience init(name: String) {
        self.init(name: name, major: "Unknown")
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}


// 부모클래스의 편의 이니셜라이저 자동 상속
let wizplan: Person = Person()
let jinSung: Student = Student(major: "Swift")
print(wizplan.name)     // Unknown
print(jinSung.name)     // Unknown
print(jinSung.major)    // Swift


// 코드 18-15 편의 이니셜라이저 자동 상속 3
class UniversityStudent: Student {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    
    convenience init(name: String, major: String, grade: String) {
        self.init(name: name, major: major)
        self.grade = grade
    }
}

let nova: UniversityStudent = UniversityStudent()
print(nova.description) // Unknwon Unknown A+

let raon: UniversityStudent = UniversityStudent(name: "raon")
print(raon.description) // raon Unknown A+

let joker: UniversityStudent = UniversityStudent(name: "joker", major: "Programming")
print(joker.description) // joker Programming A+

let chope: UniversityStudent = UniversityStudent(name: "chope", major: "Computer", grade: "C")
print(chope.description) // chope Computer C
