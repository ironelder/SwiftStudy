import Swift

// 코드 18-16 요구 이니셜라이저 정의
class Person {
    var name: String
    
    // 요구 이니셜라이저 정의
    required init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
}

let miJeong: Student = Student()
