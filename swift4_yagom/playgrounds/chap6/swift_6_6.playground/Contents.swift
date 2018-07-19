import Swift

// 코드 6-6 잘못된 case 사용
let stringValue: String = "Liam Neeson"

switch stringValue {
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jay")
    
case "Jenny":
    // stringValue가 “Jenny”에 해당할 때 실행될 코드가 와야 합니다
    // 비어있으므로 오류 발생!
case "Joker":
    // stringValue가 “Joker”에 해당할 때 실행될 코드가 와야 합니다
    // 비어있으므로 오류 발생!
case "Nova":
    print("He or She is \(stringValue)")
default:
    print("\(stringValue) said 'I don't know who you are.'")
}

