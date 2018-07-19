import Swift

// 코드 25-9 제네릭을 사용한 표현 패턴 활용
// 제네릭을 사용하기 위해 프로토콜을 정의합니다.
protocol Personalize {
    var name: String { get }
    var age: Int { get }
}

struct Person: Personalize {
    var name: String
    var age: Int
}


let star: Person = Person(name: "Star", age: 99)

/* 이제 필요 없습니다. – 제네릭을 이용해서 구현할 거니까요.
 func ~=(pattern: String, value: Person) -> Bool {
 return pattern == value.name
 }
 
 func ~=(pattern: Person, value: Person) -> Bool {
 return pattern.name == value.name && pattern.age == value.age
 }
 */

// 제네릭을 사용하여 패턴 연산자를 정의합니다.
func ~=<T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}

func ~=<T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

// 기존 패턴 연산자가 없더라도 제네릭 패턴 연산자로 똑같이 사용할 수 있습니다.
switch star {
case Person(name: "Star", age: 99): print("Same Person!!")
case "Star": print("Hello Star!!")
default: print("I don't know who you are")
}   // Same Person!!

// 이번엔 제네릭을 사용하여 패턴 연산자를 정의합니다.
// 패턴 자체가 함수임을 유심히 살펴보세요!
func ~=<T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

// 패턴에 사용할 제네릭 함수입니다.
func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
// 패턴결합을 하면 young(star)와 같은 효과를 봅니다.
case young: print("\(star.name) is young")
default: print("\(star.name) is old")
}   // Star is old

// 패턴에 사용할 제네릭 함수입니다.
func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool) {
    return { (value: T) -> Bool in value.name == pattern }	// 패턴과 값을 비교할 클로저를 반환합니다.
}

switch star {
// 패턴결합을 하면 isNamed("Jung")(star)와 같은 효과를 봅니다.
case isNamed("Jung"): print("He is Jung")
default: print("Another person")
}   // Another person

// 연산자가 함수라는 점을 생각해보면 이런 방식으로도 구현할 수 있습니다.
prefix operator ==?

prefix func ==?<T: Personalize>(pattern: String) -> ((T) -> Bool) {
    return isNamed(pattern)
}

switch star {
// 패턴결합을 하면 isNamed("Jung")(star)와 같은 효과를 봅니다.
case ==?"Jung": print("He is Jung")
default: print("Another person")
}   // Another person
