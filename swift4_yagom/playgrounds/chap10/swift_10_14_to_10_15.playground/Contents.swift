import Swift

// 코드 10-14 키 경로 타입의 타입 확인
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}
struct Stuff {
    var name: String
    var owner: Person
}
print(type(of: \Person.name)) // ReferenceWritableKeyPath<Person, String>
print(type(of: \Stuff.name)) // WritableKeyPath<Person, String>

// 코드 10-15 키 경로 타입의 경로 연결
let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)
