//: Playground - noun: a place where people can play

import UIKit

////////////////////////////////////////////////////////////////////////////////////////////////
//// 오류 처리 : 프로그램이 오류를 일으켰을 때 이것을 감지하고 회복시키는 일련의 과정
//// 스위프트에선 오류 처리 방법을 크게 두 가지로 나눌 수 있는데, 첫 째는 옵셔널이고 두 번째는 오류 처리 구문
//// 타 언어의 try ~ catch 와 같은 개념
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
//// 1. 오류의 표현
//// : 스위프트에서 오류는 Error라는 프로토콜을 준수하는 타입의 값을 통해 표현. (Error프로토콜은 요구사항 없는 빈 프로토콜)
////  오류의 종류를 나타내기엔 열거형 (enum)이 가장 적합하다.
////////////////////////////////////////////////////////////////////////////////////////////////

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

////////////////////////////////////////////////////////////////////////////////////////////////
//// 2. 오류의 포착 및 처리
//// 위와 같이 오류를 예상한 후, 프로그램 동작 중 예상한 오류로 인해 정상적인 실행이 멈추게 되면 오류를 던져준다.
//// 오류를 던져줄 땐 'throw' 키워드를 사용.
//// 오류를 처리하기 위한 네 가지 방법은 다음과 같다
////  - 함수에서 발생한 오류를 해당 함수를 호출한 코드에 알리는 방법
////  - 'do-catch' 구문을 이용하여 오류를 처리하는 방법
////  - 옵셔널 값으로 오류를 처리하는 방법
////  - 오류가 발생하지 않을 것이라고 확신하는 방법
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
//// 3. 함수에서 발생한 오류 알리기
//// try, try?, try! 키워드 등을 사용하여 던져진 오류를 받을 수 있다.
//// 함수, 메소드, 이니셜라이저의 매개변수 뒤에 'throws' 키워드를 사용하면 해당 함수, 메소드, 이니셜라이저는 오류를 던질 수 있음
//// 'throws'키워드가 추가된 함수, 메소드, 이니셜라이저 내부에서 실제로 오류를 던지는 부분에선 'throw' 키워드를 사용한다.
//// 또한 'throws' 함수 등은 키워드가 사용되지 않는 함수 등과 구분되며, 'throws'가 명시된 함수 등은 일반 함수 등으로 재정의 불가능.
//// 하지만 반대로 일반 함수 등은 'throws' 함수 등으로 재정의 가능하다.
////////////////////////////////////////////////////////////////////////////////////////////////

struct Item {
    var price: Int
    var count: Int // 재고
}

class VendingMachine {
    var inventory = [ "Candy Bar": Item(price: 12, count: 7), "Chips": Item(price: 10, count: 4), "Biscuit": Item(price: 7, count: 11) ]

    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack)제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}

let favoriteSnacks = [ "yagom": "Chips" , "jinsung": "Biscuit", "heejin":"Chocolate"]   // 딕셔너리형

//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
//    let snackName = favoriteSnacks[person] ?? "Candy Bar" // 사람이름에 해당하는 간식값이 없으면 snackName에  "Candy Bar" 할당.
//    try vendingMachine.vend(itemNamed: snackName)
//}
//
//struct PurchasedSnack {
//    let name: String
//
//    init(name: String, vendingMachine: VendingMachine) throws {
//        try vendingMachine.vend(itemNamed: name)
//        self.name = name
//    }
//}
//
//let machine: VendingMachine = VendingMachine()
//machine.coinsDeposited = 30
//
//var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine) // Biscuit 제공
//
//print(purchase.name)
//
//for (person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}

////////////////////////////////////////////////////////////////////////////////////////////////
//// 위에서 heejin의 좋아하는 음식인 Chocolate은 inventory에 없기 때문에 오류 'invalidSelection'이 발생해야함.
//// 하지만 오류가 발생했을 때 처리하는 구문을 작성하지 않아 개발자가 확인할 방법이 없다.
//// 따라서 do-catch 구문을 이용하여 오류를 처리한다.
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
//// 오류 처리 구문인 do-catch 구문은 다음과 같이 표현한다.
/*
 do {
    try 오류 발생 가능코드
    오류가 발생하지 않으면 실행할 코드
 } catch 오류 패턴 1 {
    처리 코드
 } catch 오류 패턴 2 where 추가 조건 {
    처리 코드
 }
 */
////////////////////////////////////////////////////////////////////////////////////////////////

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar" // 사람이름에 해당하는 간식값이 없으면 snackName에  "Candy Bar" 할당.
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요.")
    } catch {
        print("예상치 못한 오류 발생: ", error)
    }
}

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 20

var purchase: PurchasedSnack = PurchasedSnack(name: "Biscuit", vendingMachine: machine )

print(purchase.name)

purchase = PurchasedSnack(name: "Ice Cream", vendingMachine: machine)

print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}



////////////////////////////////////////////////////////////////////////////////////////////////
//// 4. 다시던지기
//// 다시던지기는 'rethrows' 키워드로 사용 가능하며, 다시던지기 함수는 단독으로 오류를 던질 수 없고,
//// 매개변수로 전달 받은 오류 던지기 함수만을 catch절에서 제어 가능하다.
//// 부모클래스의 다시던지기 메소드를 자식클래스에서 던지기 메소드로 재정의 불가능
//// 부모클래스의 던지기 메소드를 자식클래스에서 다시던지기 메소드로 재정의 가능
////////////////////////////////////////////////////////////////////////////////////////////////

func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

func someFunction(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    
//    do {
//        try someThrowingFunction()    // 매개변수로 전달받은 오류던지기 함수가 아니기 때문에 제어 불가능.
//    } catch {
//        throw AnotherError.justAnotherError
//    }
//
//    throw AnotherError.justAnotherError  // catch절 외부에서 오류를 던질 수 없음
}



////////////////////////////////////////////////////////////////////////////////////////////////
//// 5. 후처리 defer
//// defer 구문은 현재 코드블록을 나가기 전 꼭 실행해야하는 코드를 작성해줄 수 있음.
//// 코드블록을 나가는 것이 오류로 인해 빠져나가든, 정상적으로 실행을 마치고 나가는 것이든 마지막에 defer구문을 실행한다.
//// defer구문 내부에는 break, return 등과 같이 구문을 빠져나가거나 오류를 던지는 코드는 작성하면 안 된다.
//// 하나의 블록 내부에 여러개의 defer 구문이 있다면, 코드블록을 벗어나기 까지 작성된 것 중 마지막에 작성된 구문부터 역순으로 실행한다.
//// do구문은 catch절 없이도 작성 가능한데, 어떤 코드 블록 내부에 또 한 단계 하위의 코드 블록을 만들고자 할 때 사용.
////////////////////////////////////////////////////////////////////////////////////////////////

func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    defer {
        print("second")
    }
    
    defer {
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction(shouldThrowError: true)

try? someThrowingFunction(shouldThrowError: false)







