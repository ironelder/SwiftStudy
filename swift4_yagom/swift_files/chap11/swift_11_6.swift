import Swift

// 코드 11-6 상수 프로퍼티의 초기화
class Person {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
yagom.name = "Eric" // 오류 발생!!!


