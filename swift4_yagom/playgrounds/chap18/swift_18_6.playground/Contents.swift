import Swift

// 코드 18-6 프로퍼티 감시자 재정의
class Person {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    
    var fullName: String {
        get {
            return self.name
        }
        
        set {
            self.name = newValue
        }
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var age: Int {
        didSet {
            print("Student age : \(self.age)")
        }
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
        
        // didSet {  }  // 오류 발생!!
    }
    
    override var fullName: String {
        didSet {
            print("Full Name : \(self.fullName)")
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55  // Person age : 55
yagom.fullName = "Jo yagom"
print(yagom.koreanAge)  // 56


let jay: Student = Student()
jay.name = "jay"
jay.age = 14
// Person age : 14
// Student age : 14
jay.koreanAge = 15
// Person age : 14
// Student age : 14
jay.fullName = "Kim jay"    // Full Name : Kim jay
print(jay.koreanAge)    // 15


