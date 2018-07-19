import Swift

// 코드 7-9 inout 매개변수의 활용
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])       // 2

referenceParameter(&numbers)    // 참조를 표현하기 위해 &를 붙여줍니다.
print(numbers[1])       // 1


class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()

// 참조타입의 inout 매개변수 사용은 더욱 주의해야 합니다.
func reference(_ person: inout Person) {
    person.height = 130 // 이렇게 사용하면 기존 참조 매개변수처럼 동작하지만
    print(yagom.height) // 130
    person = Person()   // 이렇게 다른 인스턴스를 할당하면 참조 자체가 변경되어버립니다.
}

reference(&yagom)
yagom.height    // 0 - 함수 안에서 새로운 인스턴스가 할당되었기 때문에 위의 yagom과 다른 참조를 갖습니다.


// 코드 7-10 반환 값이 없는 함수의 정의와 사용
func sayHelloWorld() {
    print("Hello, world!")
}

sayHelloWorld() // Hello, world!

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName).")
}

sayHello(from: "yagom", to: "Mijeong")  // Hello Mijeong! I'm yagom.

func sayGoodbye() -> Void {	// Void를 명시해주어도 상관없습니다.
    print("Good bye")
}

sayGoodbye() // Good bye

