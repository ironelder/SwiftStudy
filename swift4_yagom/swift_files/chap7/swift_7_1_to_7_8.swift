import Swift

// 코드 7-1 기본 형태의 함수 정의와 사용
func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)	// Hello Jenny!


// 코드 7-2 매개변수가 없는 함수 정의와 사용
func helloWorld() -> String {
    return "Hello, world!"
}

print(helloWorld())	// Hello, world!


// 코드 7-3 매개변수가 여러 개인 함수의 정의와 사용
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)."
}

print(sayHello(myName: "yagom", yourName: "Jenny"))	// Hello Jenny! I'm yagom.


// 코드 7-4 매개변수 이름과 전달인자 레이블을 가지는 함수 정의와 사용
// from과 to라는 전달인자 레이블을 가지고
// myName과 name으로 매개변수 이름을 가지는 sayHello함수
func sayHello(from myName:String, to name:String) -> String {
    return "Hello \(name)! I'm \(myName)."
}

print(sayHello(from: "yagom", to: "Jenny"))	// Hello Jenny! I'm yagom.


// 코드 7-5 전달인자 레이블이 없는 함수 정의와 사용
func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello("Chope", 2))	// Hello Chope! Hello Chope!


// 코드 7-6 전달인자 레이블 변경을 통한 함수 중복 정의
func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

print(sayHello(to: "Chope", 2))
print(sayHello(to: "Chope", repeatCount: 2))


// 코드 7-7 매개변수 기본값이 있는 함수의 정의와 사용
// times 매개변수가 기본값 3을 갖습니다.
func sayHello(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}

// times 매개변수의 전달 값을 넘겨주지 않아 기본값 3을 반영해서 세 번 출력합니다.
print(sayHello("Hana"))		// Hello Hana! Hello Hana! Hello Hana!
// times 매개변수의 전달 값을 2로 넘겨주었기 때문에 전달 값을 반영해서 두 번 출력합니다.
print(sayHello("Joe", times: 2))	// Hello Joe! Hello Joe!


// 코드 7-8 가변 매개변수를 가지는 함수의 정의와 사용
func sayHelloToFriends(me: String, friends names: String...) -> String {
    
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I'm " + me + "!"
    
    return result
}

print(sayHelloToFriends(me: "yagom", friends: "Johansson", "Jay", "Wizplan"))
// Hello Johansson! Hello Jay! Hello Wizplan! I'm yagom!
print(sayHelloToFriends(me: "yagom"))
// I'm yagom!

