import Swift

// 코드 9-5 Person 클래스의 인스턴스 생성 및 소멸
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var yagom: Person? = Person()
yagom = nil     // Person 클래스의 인스턴스가 소멸됩니다.

