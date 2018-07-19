import Swift

var numberOne: Int = 5
var numberTwo: Int = 10

var stringOne: String = "A"
var stringTwo: String = "B"

var anyOne: Any = 1
var anyTwo: Any = "Two"

// 코드 22-6 제네릭을 사용한 swapTwoValues(_:_:) 함수
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)") // 10, 5

swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)") // "B, A"

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)") // "Two", 1

swapTwoValues(&numberOne, &stringOne)   // 오류!! - 같은 타입끼리만 교환 가능

