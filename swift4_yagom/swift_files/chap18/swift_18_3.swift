import Swift

// 코드 18-1 기반클래스 Person
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
}

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
}

// 코드 18-3 Student 클래스를 상속받은 UniversityStudent 클래스
class UniversityStudent: Student {
    var major: String = ""
}

let jenny: UniversityStudent = UniversityStudent()
jenny.major = "Art"
jenny.speak()   // 가나다라마바사
jenny.study()   // Study hard...

