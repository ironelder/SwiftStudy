import Swift

// 코드 18-12 이니셜라이저 자동 상속
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
    var major: String = "Swift"
}

// 부모클래스의 지정 이니셜라이저 자동 상속
let yagom: Person = Person(name: "yagom")
let hana: Student = Student(name: "hana")
print(yagom.name)   // yagom
print(hana.name)    // hana

// 부모클래스의 편의 이니셜라이저 자동 상속
let wizplan: Person = Person()
let jinSung: Student = Student()
print(wizplan.name)     // Unknown
print(jinSung.name)     // Unknown

