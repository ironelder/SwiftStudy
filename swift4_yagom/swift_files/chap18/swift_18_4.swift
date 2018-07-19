import Swift

// 코드 18-4 메서드 재정의
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
    
    override func speak() {
        print("저는 학생입니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""

    class func introduceClass() {
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+입니다."
    }
    
    override func speak() {
        super.speak()
        print("대학생이죠.")
    }
}

let yagom: Person = Person()
yagom.speak()   // 가나다라마바사

let jay: Student = Student()
jay.speak()   // 저는 학생입니다.

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()   // 저는 학생입니다. 대학생이죠.

print(Person.introduceClass())      // 인류의 소원은 평화입니다.
print(Student.introduceClass())     // 인류의 소원은 평화입니다.
print(UniversityStudent.introduceClass() as String)     // 대학생의 소원은 A+입니다.
UniversityStudent.introduceClass() as Void      // 인류의 소원은 평화입니다.


