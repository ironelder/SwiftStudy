import Swift

// 코드 13-2 정렬에 사용될 이름 배열
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

// 코드 13-3 정렬을 위한 함수 전달
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed)     // ["yagom", "wizplan", "jenny", "eric"]

// 코드 13-4 sorted(by:) 메서드에 클로저 전달
// backwards(first:second:) 함수 대신에 sorted(by:) 메서드의 전달인자로 클로저를 직접 전달합니다.
let reversed: [String] = names.sorted (by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed)     // ["yagom", "wizplan", "jenny", "eric"]


// 코드 13-5 후행 클로저 표현
// 후행 클로저의 사용
let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}

// sorted(by:) 메서드의 소괄호까지 생략 가능합니다.
let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}


// 코드 13-6 클로저의 타입 유추
// 클로저의 매개변수 타입과 반환 타입을 생략하여 표현할 수 있습니다.
let reversed: [String] = names.sorted { (first, second) in
    return first > second
}

// 코드 13-7 단축 인자 이름 사용
// 단축 인자 이름을 사용한 표현
let reversed: [String] = names.sorted {
    return $0 > $1
}

// 코드 13-8 암시적 반환 표현의 사용
// 암시적 반환 표현의 사용
let reversed: [String] = names.sorted { $0 > $1 }


// 코드 13-10 클로저로서의 연산자 함수 사용
// 연산자 함수를 클로저의 역할로 사용
let reversed: [String] = names.sorted(by: >)




