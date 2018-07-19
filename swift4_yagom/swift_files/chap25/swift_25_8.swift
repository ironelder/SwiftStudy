import Swift

// 코드 25-8 표현 패턴의 사용
switch 3 {
case 0...5: print("0과 5 사이")
default: print("0보다 작거나 5보다 큽니다.")
}   // 0과 5 사이


var point: (Int, Int) = (1, 2)

// 같은 타입 간의 비교이므로 == 연산자를 사용하여 비교할 것입니다.
switch point {
case (0, 0): print("원점")
case (-2...2, -2...2): print("(\(point.0), \(point.1))은 원점과 가깝습니다.")
default: print("point (\(point.0), \(point.1))")
}   // (1, 2)는 원점과 가깝습니다.


// String 타입과 Int 타입이 매치될 수 있도록 ~= 연산자를 정의합니다.
func ~=(pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

point = (0, 0)

// 새로 정의된 ~= 연산자를 사용하여 비교합니다.
switch point {
case ("0", "0"): print("원점")
default: print("point (\(point.0), \(point.1))")
}
// 원점


struct Person {
    var name: String
    var age: Int
}

let lingo: Person = Person(name: "Lingo", age: 99)

func ~=(pattern: String, value: Person) -> Bool {
    return pattern == value.name
}

func ~=(pattern: Person, value: Person) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}


switch lingo {
case Person(name: "Lingo", age: 99): print("Same Person!!")
case "Lingo": print("Hello Lingo!!")
default: print("I don't know who you are")
}   // Same Person!!


