import Swift

// 코드 18-11 실패 가능한 이니셜라이저의 재정의
class Person {
    var name: String
    var age: Int
    
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    
    init?(name: String, age: Int) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.age = age
    }
    
    init?(age: Int) {

        if age < 0 {
            return nil
        }
        
        self.name = "Unknown"
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    override init?(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    override init(age: Int) {
        self.major = "Swift"
        super.init()
    }
}


