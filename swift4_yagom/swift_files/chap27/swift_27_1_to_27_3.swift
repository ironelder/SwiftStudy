import Swift

// 코드 27-1 강한참조의 참조 횟수 확인
class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?


reference1 = Person(name: "yagom")
// yagom is being initialized
// 인스턴스의 참조 횟수 : 1

reference2 = reference1 // 인스턴스의 참조 횟수 : 2
reference3 = reference1 // 인스턴스의 참조 횟수 : 3

reference3 = nil    // 인스턴스의 참조 횟수 : 2
reference2 = nil    // 인스턴스의 참조 횟수 : 1
reference1 = nil    // 인스턴스의 참조 횟수 : 0
// yagom is being deinitialized



// 코드 27-2 강한참조 지역변수(상수)의 참조 횟수 확인
func foo() {
    let yagom: Person = Person(name: "yagom")   // yagom is being initialized
    // 인스턴스의 참조 횟수 : 1
    
    
    // 함수 종료 시점
    // 인스턴스의 참조 횟수 : 0
    // yagom is being deinitialized
}

foo()


// 코드 27-3 강한참조 지역변수(상수)의 참조 횟수 확인과 전역변수
var globalReference: Person?

func foo() {
    let yagom: Person = Person(name: "yagom")   // yagom is being initialized
    // 인스턴스의 참조 횟수 : 1
    
    globalReference = yagom // 인스턴스의 참조 횟수 : 2
    
    // 함수 종료 시점
    // 인스턴스의 참조 횟수 : 1
}

foo()
