import Swift

// 코드 10-16 keyPath 서브스크립트와 키 경로 활용
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

let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

// \Stuff.owner.name과 같은 표현이 됩니다.
let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져옵니다.
print(macbook[keyPath: stuffNameKeyPath]) // MacBook Pro
print(iMac[keyPath: stuffNameKeyPath]) // iMac
print(iPhone[keyPath: stuffNameKeyPath]) // iPhone
print(macbook[keyPath: ownerNameKeyPath]) // yagom
print(iMac[keyPath: ownerNameKeyPath]) // yagom
print(iPhone[keyPath: ownerNameKeyPath]) // hana

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경합니다.
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = hana
print(iMac[keyPath: stuffNameKeyPath]) // iMac Pro
print(iMac[keyPath: ownerNameKeyPath]) // hana

// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없습니다.
// macbook[keyPath: stuffNameKeyPath] = "macbook pro touch bar" // 오류 발생!
// yagom[keyPath: \Person.name] = "bear" // 오류 발생!
