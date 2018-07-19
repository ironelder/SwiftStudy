import Swift

// 코드 25-5 열거형 케이스 패턴의 사용
let someValue: Int = 30

if case 0...100 = someValue {
    print("0 <= \(someValue) <= 100")
}   // 0 <= 30 <= 100

let anotherValue: String = "ABC"

if case "ABC" = anotherValue {
    print(anotherValue)
}   // ABC


enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "크림")  // 크림 파스타
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}   // 크림 파스타

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")  // 치즈크러스트 불고기 피자 만들기
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a Pizza")
        return
    }
    
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner) // 치즈크러스트 불고기 피자

dinner = .chicken(withSauce: true)  // 양념 통닭 만들기
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}   // 양념 통닭

dinner = .rice  // 밥
dishes.append(dinner)

if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}   // 오늘 저녁은 밥입니다.

for dish in dishes {
    
    switch dish {
    case let .pasta(taste): print(taste)
    case let .pizza(dough, topping): print("\(dough, topping)")
    case let .chicken(sauced): print(sauced ? "양념" : "후라이드")
    case .rice: print("Just 쌀")
    }
}
/*
 크림
 ("치즈크러스트", "불고기")
 양념
 Just 쌀
 */

