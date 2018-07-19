import Swift

// 코드 13-11 makeIncrementer(forIncrement:) 함수
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// 코드 13-14 각각의 incrementer의 동작
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first: Int = incrementByTwo()   // 2
let second: Int = incrementByTwo()  // 4
let third: Int = incrementByTwo()   // 6

let first2: Int = incrementByTwo2()   // 2
let second2: Int = incrementByTwo2()  // 4
let third2: Int = incrementByTwo2()   // 6

let ten: Int = incrementByTen()         // 10
let twenty: Int = incrementByTen()      // 20
let thirty: Int = incrementByTen()      // 30

