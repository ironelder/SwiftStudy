import Swift

// 코드 22-7 제네릭을 사용하지 않은 IntStack 구조체 타입
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var integerStack: IntStack = IntStack()

integerStack.push(3)
print(integerStack.items)   // [3]

integerStack.push(2)
print(integerStack.items)   // [3, 2]

integerStack.push(3)
print(integerStack.items)   // [3, 2, 3]

integerStack.push(5)
print(integerStack.items)   // [3, 2, 3, 5]

integerStack.pop()
print(integerStack.items)   // [3, 2, 3]

integerStack.pop()
print(integerStack.items)   // [3, 2]

integerStack.pop()
print(integerStack.items)   // [3]

integerStack.pop()
print(integerStack.items)   // []


// 코드 22-8 제네릭을 사용한 Stack 구조체 타입
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.items)    // [1.0]
doubleStack.push(2.0)
print(doubleStack.items)    // [1.0, 2.0]
doubleStack.pop()
print(doubleStack.items)    // [1.0]

var stringStack: Stack<String> = Stack<String>()

stringStack.push("1")
print(stringStack.items)    // ["1"]
stringStack.push("2")
print(stringStack.items)    // ["1", "2"]
stringStack.pop()
print(stringStack.items)    // ["1"]

var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(1.0)
print(anyStack.items)    // [1.0]
anyStack.push("2")
print(anyStack.items)    // [1.0, "2"]
anyStack.push(3)
print(anyStack.items)    // [1.0, "2", 3]
anyStack.pop()
print(anyStack.items)    // [1.0, "2"]


// 코드 22-9 익스텐션을 통한 제네릭 타입의 기능 추가
extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

print(doubleStack.topElement)   // Optional(1.0)
print(stringStack.topElement)   // Optional("1")
print(anyStack.topElement)      // Optional("2")

