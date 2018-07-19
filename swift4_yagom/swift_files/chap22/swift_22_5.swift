import Swift

var stringOne: String = "B"
var stringTwo: String = "A"

// 코드 22-5 제네릭을 사용하지 않은 swapTwoValues(_:_:) 함수
func swapTwoValues(_ a: inout Any, _ b: inout Any) {
    let temporaryA: Any = a
    a = b
    b = temporaryA
}

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&anyOne, &anyTwo)

print("\(anyOne), \(anyTwo)") // "Two", 1


anyOne = stringOne
anyTwo = stringTwo

swapTwoValues(&anyOne, &anyTwo)

print("\(anyOne), \(anyTwo)") // "A, B"
print("\(stringOne), \(stringTwo)") // "B, A"

swapTwoValues(&stringOne, &stringTwo)   // 오류 – Any 외 다른 타입의 전달인자 전달 불가

