import Swift

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}


// 코드 9-7 식별 연산자의 사용
var yagom: Person = Person()
let friend: Person = yagom              // yagom의 참조를 할당합니다.
let anotherFriend: Person = Person()    // 새로운 인스턴스를 생성합니다.

print(yagom === friend)             // true
print(yagom === anotherFriend)      // false
print(friend !== anotherFriend)     // true



