import Swift

// 코드 13-21 클로저를 이용한 연산 지연

// 대기 중인 손님들입니다.
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine.count)    // 4

// 클로저를 만들어두면 클로저 내부의 코드를 미리 실행(연산)하지 않고 가지고만 있습니다.
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)    // 4

// 실제로 실행합니다.
print("Now serving \(customerProvider())!") // "Now serving YoangWha!"
print(customersInLine.count)    // 3


// 코드 13-22 함수의 전달인자로 전달하는 클로저
customersInLine = ["YoangWha", "SangYong", "SungHun", "HaMi"]

func serveCustomer(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeFirst() } )   // "Now serving YoangWha!"


// 코드 13-23 자동 클로저의 사용
customersInLine = ["YoangWha", "SangYong", "SungHun", "HaMi"]

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeFirst()) // "Now serving YoangWha!"


// 코드 13-24 자동 클로저의 탈출
customersInLine = ["minjae", "innoceive", "sopress"]

func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider2())!") // "Now serving minjae!"

