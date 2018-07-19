import Swift

// 코드 25-6 옵셔널 패턴의 사용
var optionalValue: Int? = 100

if case .some(let value) = optionalValue {
    print(value)
}   // 100

if case let value? = optionalValue {
    print(value)
}   // 100


func isItHasValue(_ optionalValue: Int?) {
    guard case .some(let value) = optionalValue else {
        print("none")
        return
    }
    
    print(value)
}
isItHasValue(optionalValue) // 100


while case .some(let value) = optionalValue {
    print(value)
    optionalValue = nil
}   // 100

print(optionalValue)    // nil

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}
// Found a 2
// Found a 3
// Found a 5


