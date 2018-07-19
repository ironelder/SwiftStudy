import Swift

// 코드 18-8 final 키워드의 사용
class Person {
    final var name: String = ""
    
    final func speak() {
        print("가나다라마바사")
    }
}

final class Student: Person {
    // 오류!
    // Person의 name은 final을 사용하여
    // 재정의를 할 수 없도록 했기 때문입니다.
    override var name: String {
        set {
            super.name = newValue
        }
        get {
            return "학생"
        }
    }
    
    // 오류! 
    // Person의 speak()는 final을 사용하여
    // 재정의를 할 수 없도록 했기 때문입니다.
    override func speak() {
        print("저는 학생입니다.")
    }
}

// 오류!
// Student 클래스는 final을 사용하여
// 상속할 수 없도록 했기 때문입니다.
class UniversityStudent: Student { }








