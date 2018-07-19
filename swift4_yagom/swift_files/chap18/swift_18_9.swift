import Swift

// 코드 18-9 Person 클래스를 상속받은 Student 클래스
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    init(name: String, age: Int, major: String) {
        self.major = "Swift"
        super.init(name: name, age: age)         
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7, major: "")
    }
}
