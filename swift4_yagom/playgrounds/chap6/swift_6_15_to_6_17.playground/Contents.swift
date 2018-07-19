import Swift

// 코드 6-15 while 반복 구문의 사용
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")  // removeFirst()는 요소를 삭제함과 동시에 삭제한 요소를 반환합니다.
}

// Good bye Joker
// Good bye Jenny
// Good bye Nova
// Good bye yagom


// 코드 6-16 repeat-while 반복 구문의 사용
names = ["John", "Jenny", "Joe", "yagom"]

repeat {
    print("Good bye \(names.removeFirst())")  // removeFirst()는 요소를 삭제함과 동시에 삭제한 요소를 반환합니다.
} while names.isEmpty == false

// Good bye John
// Good bye Jenny
// Good bye Joe
// Good bye yagom


// 코드 6-17 중첩된 반복문의 구문 이름표 사용
var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
    if num > 5 || num < 1{
        continue numbersLoop
    }
    
    var count: Int = 0
    
    printLoop: while true {
        
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}

// 3
// 3
// 3
// numbers에는 [2342, 6, 3252]가 남습니다.

