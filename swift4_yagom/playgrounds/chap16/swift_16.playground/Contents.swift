import Swift

// 코드 16-1 addThree 함수
func addThree(_ num: Int) -> Int {
    return num + 3
}

// 코드 16-2 일반 값을 연산할 수 있는 addThree 함수
addThree(2) // 5

// 코드 16-3 옵셔널을 연산할 수 없는 addThree 함수
/*
addThree(Optional(2))   // 오류 발생!
*/

// 코드 16-4 맵 메서드를 사용하여 옵셔널을 연산할 수 있는 addThree(_:) 함수
Optional(2).map(addThree)   // Optional(5)


// 코드 16-5 옵셔널에 맵 메서드와 클로저의 사용
var value: Int? = 2

value.map{ $0 + 3 } // Optional(5)

value = nil

value.map{ $0 + 3 } // nil == Optional.none


// 코드 16-7 doubledEven(_:) 함수와 플랫맵의 사용
func doubledEven(_ num: Int) -> Int? {
    if num % 2 == 0 {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven)
// nil == Optional.none


// 코드 16-8 맵과 플랫맵의 차이
let optionalArr: [Int?] = [1, 2, nil, 5]

let mappedArr: [Int?] = optionalArr.map{ $0 }
let flatmappedArr: [Int] = optionalArr.flatMap{ $0 }

print(mappedArr)        // [Optional(1), Optional(2), nil, Optional(5)]
print(flatmappedArr)    // [1, 2, 5]


// 코드 16-9 중첩된 컨테이너에서 맵과 플랫맵의 차이
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 } }

print(mappedMultipleContainer)        // [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatmappedMultipleContainer)    // [1, 2, 3, 4, 5]


// 코드 16-10 플랫맵의 활용
func stringToInt(str: String) -> Int? {
    return Int(str)
}

func intToString(integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

var result: Any = optionalString.flatMap(stringToInt).flatMap(intToString).flatMap(stringToInt)
print(result)   // Optional(2)
result = optionalString.map(stringToInt) // 더 이상 체인 연결 불가
print(result)   // Optional(Optional(2))

// 코드 16-12 옵셔널 바인딩을 통한 연산
if let str: String = optionalString {
    if let num: Int = stringToInt(str: str) {
        if let finalStr: String = intToString(integer: num) {
            if let finalNum: Int = stringToInt(str: finalStr) {
                result = Optional(finalNum)
            }
        }
    }
}

print(result)   // Optional(2)

if let str: String = optionalString, let num: Int = stringToInt(str: str), let finalStr: String = intToString(integer: num), let finalNum: Int = stringToInt(str: finalStr) {
                result = Optional(finalNum)
}

print(result)   // Optional(2)


// 코드 16-13 플랫맵 체이닝 중 빈 컨텍스트를 만났을 때의 결과
func intToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

result = optionalString.flatMap(stringToInt).flatMap(intToNil).flatMap(stringToInt)
print(result)   // nil
