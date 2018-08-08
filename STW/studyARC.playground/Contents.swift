//: Playground - noun: a place where people can play

import UIKit

////////////////////////////////////////////////////////////////////////////////////////////////
//// ARC (Automatic Reference Counting) : 참조 횟수 계산은 참조형인 클래스의 인스턴스에만 적용된다.
//// 따라서 값 타입인 구조체나 열거형은 참조 횟수 계산과 무관.
//// ARC는 몇 가지 규칙에 따라 인스턴스의 참조 여부를 추적하여 메모리를 관리한다.
////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////
//// 1. 강한참조
////  : 인스턴스는 참조 횟수가 0이 되는 순간 메모리에서 해제된다.
////   인스턴스에 강한 참조를 사용하면 참조 횟수가 1 증가하고, 프로퍼티나 변수, 상수등에 nil을 할당하면 참조 횟수 1 감소한다.
////   참조의 기본은 강한 참조이므로, 프로퍼티, 변수, 상수등을 선언할 때 별도의 식별자를 명시하지 않으면 강한참조를 한다.
////////////////////////////////////////////////////////////////////////////////////////////////

//class Person {
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}

//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
//reference1 = Person(name: "yagom")
//// yagom is being initialized
//// 인스턴스의 참조 횟수 : 1
//
//reference2 = reference1 // 인스턴스의 참조 횟수 : 2
//reference3 = reference1 // 인스턴스의 참조 횟수 : 3
//
//reference3 = nil // 인스턴스의 참조 횟수 : 2
//reference2 = nil // 인스턴스의 참조 횟수 : 1
//reference1 = nil // 인스턴스의 참조 횟수 : 0
//// yagom is being deinitialized
//
//
//func foo() {
//    let yagom: Person = Person(name: "yagom") // yagom is being initialized
//    // 인스턴스의 참조 횟수 1
//
//    // 함수 종료 시점
//    // 인스턴스의 참조 횟수 : 0
//    // yagom is being deinitialized
//}
//
//foo()

////////////////////////////////////////////////////////////////////////////////////////////////

//var globalReference: Person?
//
//func foo() {
//    let yagom: Person = Person(name: "yagom") // yagom is being initialized
//    // 인스턴스의 참조 횟수 : 1
//
//    globalReference = yagom // 인스턴스의 참조 회숫 : 2
//
//    // 함수 종료 시점
//    // 인스턴스의 참조 횟수 : 1
//}
//
//foo()

////////////////////////////////////////////////////////////////////////////////////////////////
// 2. 강한참조 순환 문제
// : 복합적으로 강한참조가 일어나는 상황에서 규칙을 모르고 사용하게 되면 문제가 발생할 수 있음.
//  대표적으로 인스턴스끼리 서로가 서로를 강한참조하는 것인데 이를 강한참조 순환이라고 한다.
////////////////////////////////////////////////////////////////////////////////////////////////

//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    var room: Room?
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Room {
//    let number: String
//
//    init(number: String) {
//        self.number = number
//    }
//
//    var host: Person?
//
//    deinit {
//        print("Room \(number) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom") // Person 인스턴스의 참조 횟수 : 1
//var room: Room? = Room(number: "505")      // Room 인스턴스의 참조 횟수 : 1
//
//room?.host = yagom  // Person 인스턴스의 참조 횟수 : 2
//yagom?.room = room  // Room 인스턴스의 참조 횟수 : 2
//
//yagom = nil // Person 인스턴스의 참조 횟수 : 1
//room = nil  // Room 인스턴스의 참조 횟수 : 1
//
//// Person 및 Room 인스턴스의 참조할 방법 상실 - 메모리에 잔존
//
////room?.host = nil
////yagom?.room = nil


////////////////////////////////////////////////////////////////////////////////////////////////
// 3. 약한 참조
//  : 약한참조는 강한참조와 다르게 인스턴스의 참조 횟수를 증가시키지 않음.
//  참조 타입의 프로퍼티나 변수 선언 앞에 weak 키워드를 써주면 약한참조 사용 가능.
//  약한참조는 자신이 참조하던 인스턴스가 해제되면 nil이 할당될 수 있어야하기 때문에 상수를 사용 할 수 없음.
//  즉 '옵셔널 변수'만이 약한참조가 가능하다.
////////////////////////////////////////////////////////////////////////////////////////////////

//class Person {
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    var room: Room?
//
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Room {
//    let number: String
//
//    init(number: String) {
//        self.number = number
//    }
//
//    weak var host: Person?
//
//    deinit {
//        print("Room \(number) is being deinitialized")
//    }
//}
//
//var yagom: Person? = Person(name: "yagom") // Person 인스턴스 참조 횟수 : 1
//var room: Room? = Room(number: "505")      // Room 인스턴스의 참조 횟수 : 1
//
//room?.host = yagom // Person 인스턴스의 참조 횟수 : 1 (약한 참조)
//yagom?.room = room // Room 인스턴스의 참조 횟수 : 2
//
//yagom = nil // Person 인스턴스의 참조 횟수 : 0, Room 인스턴스의 참조 횟수 : 1
//// 인스턴스가 메모리에서 해제될 때 자신이 강한참조하던 인스턴스의 참조 횟수를 1 감소시킨다.
//// yagom is being deinitialized
//
//print(room?.host) // nil
//
//room = nil // Room 인스턴스의 참조 횟수 : 0
//// Room 505 is being deinitialized

////////////////////////////////////////////////////////////////////////////////////////////////
// 4. 미소유참조
// : 약한 참조와 마찬가지로 미소유참조 또한 인스턴스의 참조 횟수를 증가시키지 않는다.
//  약한참조와 다르게, 미소유참조는 참조하는 인스턴스가 항상 메모리에 존재할 것이란 걸 전제로 동작하기 때문에
//  참조하는 인스턴스가 메모리에서 해제되더라도 자동으로 자신에게 nil을 할당하지 않으며, 따라서 옵셔널이나 변수가 아니어도 사용 가능하다.
//  하지만 미소유 참조를 하면서 메모리에서 해제된 인스턴스에 접근하려 한다면 잘못된 메모리에 접근하는 것이므로 런타임 오류가 발생한다.
//  미소유참조는 'unowned' 키워드로 사용할 수 있음.
////////////////////////////////////////////////////////////////////////////////////////////////

//class Person {
//    let name: String
//
//    var card: CreditCard?
//
//    init(name: String) {
//        self.name = name
//    }
//
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class CreditCard {
//    let number: UInt
//    unowned let owner: Person
//
//    init(number: UInt, owner: Person) {
//        self.number = number
//        self.owner = owner
//    }
//
//    deinit {
//        print("Card #\(number) is being deinitialized")
//    }
//}
//
//var jisoo: Person? = Person(name: "Jisoo")  // Person 인스턴스 참조 횟수 : 1
//
//if let person: Person = jisoo {
//    person.card = CreditCard(number: 1004, owner: person)   // CreditCard 인스턴스 참조 횟수 :1 , Person 인스턴스의 참조 횟수 : 1
//}
//
//jisoo = nil // Person 인스턴스의 참조 횟수 : 0
//// CreditCard 인스턴스의 인스턴스의 참조 횟수 : 0 ( jisoo의 인스턴스가 메모리에서 해제되면서 jisoo 인스턴스가 강한 참조하던 CreditCard의 인스턴스 참조 횟수 1 감소)
//// jisoo is being deinitialized
//// Card #1004 is being deinitialized




////////////////////////////////////////////////////////////////////////////////////////////////
// 5. 미소유참조와 암시적 추출 옵셔널 프로퍼티
// : 서로 참조해야 하는 프로퍼티에 값이 꼭 있어야 하면서도 한 번 초기화되면 그 이후에는 nil을 할당할 수 없는 조건을 갖추어야하는 경우
//  서로 참조해야하기에 미소유참조는 불가능, nil을 할당할 수 없으므로 약한참조도 불가능하다.
////////////////////////////////////////////////////////////////////////////////////////////////

class Company {
    let name: String
    
    var ceo: CEO! // 암시적 추출 옵셔널 프로퍼티 (강한 참조)
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self) // Company 타입의 인스턴스를 초기화 할 때, CEO타입의 인스턴스를 생성하는 과정에서 자기 자신을 참조하도록 보내줘야하기 때문이다.
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
    
}

class CEO {
    let name: String
    
    unowned let company: Company // 미소유참조 상수 프로퍼티 (company는 옵셔널이 될 수 없으므로)
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)는(은) \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()     // 무한상사의 CEO는 김태호입니다.
company.ceo.introduce() // 김태호는(은) 무한상사의 CEO입니다.



////////////////////////////////////////////////////////////////////////////////////////////////
// 6. 클로저의 강한참조 순환
// : 강한참조는 클로저가 인스턴스의 프로퍼티일 때, 클로저의 값 획득 특성 때문에도 발생한다.
//  클로저 또한 참조 타입이기 때문에, 클로저 내부에서 인스턴스의 프로퍼티에 접근하거나 메소드를 호출할 때 참조가 발생한다.
////////////////////////////////////////////////////////////////////////////////////////////////

class Person {
    let name: String
    let hobby: String?

    lazy var introduce: () -> String = {

        var introduction: String = "My name is \(self.name)."
        // 클로저가 자신이 호출됨과 동시에 자신 내부의 참조들을 사용할 수 있도록 참조 횟수를 증가시키고, 자신을 프로퍼티로 갖는 인스턴스의 참조 횟수도 증가
        // 즉 클로저의 참조 횟수 : 1 증가, 클로저를 프로퍼티로 갖는 Person 인스턴스의 참조 횟수 : 1 증가

        guard let hobby = self.hobby else {
            return introduction
        }

        introduction += " "
        introduction += "My hobby is \(hobby)."

        return introduction
    }

    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
print(yagom?.introduce())   // My name is yagom. My hobby is eatting
yagom = nil
// Person의 인스턴스에 nil을 할당해도 메모리에서 해제되지 않음.


////////////////////////////////////////////////////////////////////////////////////////////////
// 7. 획득 목록
// : 획득 목록은 클로저 내부에서 참조타입을 획득하는 규칙을 제시해줄 수 있는 기능
//  획득 목록은 클로저 내에서 하나 이상의 참조 타입을 획득할 때 사용하는 규칙을 제시한다.
////////////////////////////////////////////////////////////////////////////////////////////////

class SimpleClass {
    var value: Int = 0
}

var x: SimpleClass? = SimpleClass()
var y = SimpleClass()

let closure = { [weak x, unowned y] in
    print(x?.value, y.value)
}

x = nil
y.value = 10

closure()



////////////////////////////////////////////////////////////////////////////////////////////////



