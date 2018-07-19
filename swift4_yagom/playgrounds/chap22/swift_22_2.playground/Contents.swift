import Swift

// 코드 22-2 프로토콜과 제네릭을 이용한 전위 연산자 구현과 사용
prefix operator **

prefix func **<T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)    // 25
print(sqrtFive)         // 25
