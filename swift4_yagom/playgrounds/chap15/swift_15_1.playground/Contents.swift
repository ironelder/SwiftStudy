import Swift

// 코드 15-1 for-in 구문과 맵 메서드의 사용 비교
let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

// for 구문 사용
for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)          // ["0", "1", "2", "3", "4"]


// map 메서드 사용
doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubledNumbers)   // [0, 2, 4, 6, 8]
print(strings)          // ["0", "1", "2", "3", "4"]
