//: Playground - noun: a place where people can play

import UIKit

let names: [String] = ["wizplan", "eric", "yagom", "jenny" ]

func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교 중")
    return first > second
}


//let reversed: [String] = names.sorted(by: backwards)
//print(reversed)    // [“yagom”, “wizplan”, “Jenny”, “eric”]


// 클로저 구문 사용
let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in return first > second})
print(reversed)    // [“yagom”, “wizplan”, “Jenny”, “eric”]



// 후행 클로저의 사용 sroted( Int, String, (String, String) -> Bool)
let reversed2: [String] = names.sorted() { (first: String, second: String) -> Bool in return first > second}

// sorted(by: ) 메소드의 소괄호 생략
let reversed3: [String] = names.sorted { (first: String, second: String) -> Bool in return first > second}


////////////////////////////////////////////////////////////////////////////////////////////////////////////



func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first: Int = incrementByTwo()   // 호출할 때마다 2씩 증가
let second: Int = incrementByTwo2()

let first2: Int = incrementByTen()  // 호출할 때마다 10씩 증가
let second2: Int = incrementByTen()



// 클로저는 참조 타입 예제
//let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
//let sameWithIncrementByTwo: (() -> Int) = incrementByTwo
//
//let first: Int = incrementByTwo()
//let second: Int = sameWithIncrementByTwo()


////////////////////////////////////////////////////////////////////////////////////////////////////////////

//탈출 클로저

//func callback(fn: () -> Void) {
//    fn()
//}
//callback {
//    print("closure가 실행되었습니다.")
//}

// 탈출 불가 클로저를 @escaping 키워드를 사용하여 상수에 대입할 수 있도록 해줌.
func callback(fn: @escaping () -> Void) {
    let f = fn // 인자값으로 전달된 클로저를 상수 f에 대입
    f() // 대입된 클로저를 실행
}
callback{
    print("Closure가 실행되었습니다.")
}

// 탈출 불가 클로저에서는 내부 프로퍼티에 접근할 때 self를 생략해도 되지만, 탈출 가능한 클로저는 self라고 명시해줘야 함.
typealias VoidVoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscpaingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}


class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        //탈출 불가 클로저에서 self 키워드 사용은 선택 사항.
        functionWithNoescapeClosure {  x = 200  }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        // 탈출 클로저에서는 명시적으로 self를 사용해야함.
        return functionWithEscpaingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)
let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)


////////////////////////////////////////////////////////////////////////////////////////////////////////////



func condition(stmt: @autoclosure ()-> Bool) {
    if stmt() == true {
        print("결과가 참입니다.")
    } else {
        print("결과가 거짓입니다.")
    }
}

// 실행 방법
condition(stmt: (4>2) )

//// 실행 방법 1 : 일반 구문
//condition(stmt: {4>2})
//
//// 실행 방법 2 : 클로저 구문
//condition{4>2}
//
//
////STEP 1 : 경량화 되지 않은 클로저 전체 구문
//condition(stmt: {() -> Bool in
//    return (4>2)
//})
//
////STEP 2 : 클로저 타입 선언 생략
//condition{
//    return (4>2)
//}
//
////STEP 3 : 클로저 반환구문 생략
//condition{
//    4>2
//}


var arrs = [String]()

func addVars(fn: @autoclosure () -> Void) {
    arrs = Array(repeating: "", count: 3)

    fn()
}

//arrs.insert("KR", at: 1)
print(arrs)
//addVars(fn: arrs.insert("KR", at: 1))
addVars(fn: arrs.insert("KR", at:1))
print(arrs)
