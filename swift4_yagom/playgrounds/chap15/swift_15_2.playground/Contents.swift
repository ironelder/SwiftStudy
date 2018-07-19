import Swift

// 코드 15-2 클로저 표현의 간략화
let numbers: [Int] = [0, 1, 2, 3, 4]

// 기본 클로저 표현식 사용
var doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

// 매개변수 및 반환 타입 생략
doubledNumbers = numbers.map({ return $0 * 2 } )
print(doubledNumbers)   // [0, 2, 4, 6, 8]

// 반환 키워드 생략
doubledNumbers = numbers.map({ $0 * 2 } )
print(doubledNumbers)   // [0, 2, 4, 6, 8]

// 후행 클로저 사용
doubledNumbers = numbers.map { $0 * 2 } 
print(doubledNumbers)   // [0, 2, 4, 6, 8]

