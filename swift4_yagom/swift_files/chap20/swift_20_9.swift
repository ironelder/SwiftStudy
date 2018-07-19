import Swift

protocol Named {
    var name: String { get }
    
    init(name: String)
}

// 코드 20-9 상속 불가능한 클래스의 이니셜라이저 요구 구현
final class Person: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
