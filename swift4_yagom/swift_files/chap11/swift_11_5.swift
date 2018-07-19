import Swift

// 코드 11-5 Person 클래스
class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")

print(yagom.name)   // "yagom"
print(yagom.age)    // nil

yagom.age = 99

print(yagom.age)    // 99

yagom.name = "Eric"

print(yagom.name)   // "Eric"

 
