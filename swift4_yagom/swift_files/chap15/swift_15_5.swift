import Swift

// 코드 15-5 필터 메서드의 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)  // [0, 2, 4]

let oddNumbers: [Int] = numbers.filter{ $0 % 2 != 0 }
print(oddNumbers)   // [1, 3, 5]

