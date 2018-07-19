import Swift

// 코드 부록-1 스위프트 주요 함수의 사용
abs(-100)   // 100
abs(100)    // 100

let int8: Int8 = 5
let int64: Int64 = numericCast(int8)

let zeroes = repeatElement(0, count: 5)
for x in zeroes {
    print(x)
}
// 0
// 0
// 0
// 0
// 0

var valueA: Int = 10
var valueB: Int = 10

assert(valueA == valueB, "valueA != valueB")
// assertionFailure("just assertion failure")   // fatal error: just assertion failure: file playground.swift, line 8

debugPrint(valueA, valueB, separator: ",", terminator: "")  // 10,10
debugPrint(valueA, valueB)  // 10 10

dump(valueA)    // 10

// fatalError()    // fatal error: : playground.swift, line 15

max(1, 3)   // 3
max(1, 2, 3, 4, 5, 6, 7, 8) // 8
min(1, 3)   // 1
min(1, 2, 3, 4, 5, 6, 7, 8) // 1

precondition(valueA == valueB, "valueA != valueB")
// preconditionFailure("valueA != valueB") // fatal error: valueA != valueB: file playground.swift, line 23

print(valueA, valueB, separator: ",", terminator: "")   // 10,10
print(valueA, valueB)   // 10 10

valueA = 100
valueB = 200

swap(&valueA, &valueB)

print(valueA, valueB)   // 200 100


let words = ["하나", "둘", "셋", "넷"]
let numbers = 1...4

for (word, number) in zip(words, numbers) {
    print("\(word): \(number)")
}
// "하나: 1"
// "둘: 2
// "셋: 3"
// "넷: 4"

let naturalNumbers = 1...Int.max
let zipped = Array(zip(words, naturalNumbers))

print(zipped)
// [("하나", 1), ("둘", 2), ("셋", 3), ("넷", 4)]
