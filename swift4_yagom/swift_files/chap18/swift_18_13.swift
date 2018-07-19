import Swift

// 코드 18-13 편의 이니셜라이저 자동 상속
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

    override init(name: String) { 
        self.major = "Unknown"
        super.init(name: name)
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name) 
    }
}

// 부모클래스의 편의 이니셜라이저 자동 상속
let wizplan: Person = Person()
let jinSung: Student = Student()
print(wizplan.name)     // Unknown
print(jinSung.name)     // Unknown


