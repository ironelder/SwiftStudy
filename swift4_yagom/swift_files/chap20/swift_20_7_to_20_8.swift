import Swift

// 코드 20-7 프로토콜의 이니셜라이저 요구와 구조체의 이니셜라이저 요구 구현
protocol Named {
    var name: String { get }
    
    init(name: String)
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}


// 코드 20-8 클래스의 이니셜라이저 요구 구현
class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}
