import Swift

// 코드 18-18 일반 이니셜라이저의 요구 이니셜라이저 변경
class Person {
    var name: String
    
     init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"

    init(major: String) {
        self.major = major
        super.init()
    }

    // 부모클래스의 이니셜라이저를 재정의함과 동시에
    // 요구 이니셜라이저로 변경됨을 알립니다.
    required override init() {
        self.major = "Unknwon"
        super.init()
    }
    
    // 이 요구 이니셜라이저는 앞으로 계속 요구됩니다.
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }

    // Student 클래스에서 요구하였으므로 구현해주어야 합니다.
    required init() {
        self.grade = "F"
        super.init()
    }

    // Student 클래스에서 요구하였으므로 구현해주어야 합니다.
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

let yagom: UniversityStudent = UniversityStudent()
print(yagom.grade)  // F

let juHyun: UniversityStudent = UniversityStudent(name: "JuHyun")
print(juHyun.name)  // JuHyun






