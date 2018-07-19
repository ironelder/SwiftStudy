import Swift

// 코드 18-17 요구 이니셜라이저 재구현
class Person {
    var name: String
    
    // 요구 이니셜라이저 정의
    required init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"

    // 자신의 지정 이니셜라이저 구현
    init(major: String) {
        self.major = major
        super.init()
    }
    
    required init() {
        self.major = "Unknwon"
        super.init()
    }
}

class UniversityStudent: Student {
    var grade: String
    
    // 자신의 지정 이니셜라이저 구현
    init(grade: String) {
        self.grade = grade
        super.init()
    }

    required init() {
        self.grade = "F"
        super.init()
    }
}

let jiSoo: Student = Student()
print(jiSoo.major)      // Unknwon

let yagom: Student = Student(major: "Swift")
print(yagom.major)      // Swift

let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
print(juHyun.grade)     // A+

