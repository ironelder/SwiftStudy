import Swift

protocol Named {
    var name: String { get }
    
    init(name: String)
}

// 코드 20-10 상속받은 클래스의 이니셜라이저 요구 구현 및 재정의
class School {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class MiddleSchool: School, Named {
    required override init(name: String) {
        super.init(name: name)
    }
}
