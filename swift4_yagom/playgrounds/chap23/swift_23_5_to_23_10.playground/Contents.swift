import Swift

// 코드 23-5 Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in
    return item * 10
}

print(mappedItems)  // [10, 20, 30]

protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
    
    // 코드 23-6 Stack 구조체의 맵 메서드
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        
        return transformedStack
    }
    
    
    // 코드 23-8 Stack 구조체의 필터 메서드
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        
        var filteredStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filteredStack.items.append(item)
            }
        }
        
        return filteredStack
    }
    
    // 코드 23-10 Stack 구조체의 리듀스 메서드
    func reduce<T>(_ initial: T, combine: (T, Element) -> T) -> T {
        
        var result: T = initial
        
        for item in items {
            result = combine(result, item)
        }
        
        return result
    }
}

// 코드 23-6 Stack 구조체의 맵 메서드
var myIntStack: Stack<Int> = Stack<Int>()
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)

myIntStack.printSelf()  // [1, 5, 2]

var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()  // ["1", "5", "2"]


// 코드 23-7 Array 타입의 필터 사용
let filteredItems: Array<Int> = items.filter { (item: Int) -> Bool in
    return item % 2 == 0
}

print(filteredItems)    // [2]


// 코드 23-8 Stack 구조체의 필터 메서드
let filteredStack: Stack<Int> = myIntStack.filter { (item: Int) -> Bool in
    return item < 5
}

filteredStack.printSelf()   // [1, 2]


// 코드 23-9 Array 타입의 리듀스 사용
let combinedItems: Int = items.reduce(0) { (result: Int, item: Int) -> Int in
    return result + item
}

print(combinedItems)    // 6

let combinedItemsDoubled: Double = items.reduce(0.0) { (result: Double, item: Int) -> Double in
    return result + Double(item)
}

print(combinedItemsDoubled) // 6.0
let combinedItemsString: String = items.reduce("") { (result: String, item: Int) -> String in
    return result + "\(item) "
}

print(combinedItemsString) // "1 2 3 "


// 코드 23-10 Stack 구조체의 리듀스 메서드
let combinedInt: Int = myIntStack.reduce(100) { (result: Int, item: Int) -> Int in
    return result + item
}
print(combinedInt) // 108


let combinedDouble: Double = myIntStack.reduce(100.0) { (result: Double, item: Int) -> Double in
    return result + Double(item)
}
print(combinedDouble) // 108.0


let combinedString: String = myIntStack.reduce("") { (result: String, item: Int) -> String in
    return result + "\(item) "
}
print(combinedString) // "1 5 2 "

