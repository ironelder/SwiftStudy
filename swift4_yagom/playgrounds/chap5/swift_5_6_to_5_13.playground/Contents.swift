import Swift

// 코드 5-6 전위 연산자 정의
prefix operator **

// 코드 5-7 전위 연산자 구현과 사용
prefix func **(value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive) // 25


// 코드 5-8 전위 연산자 함수 중복 정의와 사용
prefix func !(value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "yagom"
var isEmptyString: Bool = !stringValue

print(isEmptyString)    // false

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString)    // true

// 코드 5-9 사용자정의 전위 연산자 함수 중복 정의와 사용
prefix func **(value: String) -> String {
    return value + " " + value
}

let resultString: String = **"yagom"

print(resultString)     // yagom yagom



// 코드 5-10 사용자정의 후위 연산자 정의와 함수 구현
postfix operator **

postfix func **(value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen)  // 15


// 코드 5-11 전위 연산자와 후위 연산자 동시 사용
let sqrtFivePlusTen: Int = **five**

print(sqrtFivePlusTen)  // (10+5) * (10+5) == 225

// 코드 5-12 중위 연산자의 정의
infix operator ** : MultiplicationPrecedence

// 코드 5-13 중위 연산자의 구현과 사용
// String 타입의 contains(_:) 메서드를 사용하기 위해 Foundation 프레임워크를 임포트합니다.
import Foundation

func **(lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloYagom: String = "Hello yagom"
let yagom: String = "yagom"

let isContainsYagom: Bool = helloYagom ** yagom     // true

