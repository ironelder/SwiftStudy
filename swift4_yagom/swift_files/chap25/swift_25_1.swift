import Swift

// 코드 25-1 와일드카드 패턴의 사용
let string: String = "ABC"

switch string {
case _: print(string)   // ABC -> 어떤 값이 와도 상관없기에 항상 실행됩니다.
}


let optionalString: String? = "ABC"

switch optionalString {
case "ABC"?: print(optionalString)  // optionalString이 Optional("ABC")일 때만 실행됩니다.
case _?: print("Has value, but not ABC") // optionalString이 Optional("ABC") 외의 값이 있을 때만 실행됩니다.
case nil: print("nil")  // 값이 없을 때 실행됩니다.
}  // Optional(“ABC”)

let yagom = ("yagom", 99, "Male")

switch yagom {
case ("yagom", _, _): print("Hello yagom!!!")   // 첫 번째 요소가 "yagom"일 때만 실행됩니다.
case (_, _, _): print("Who cares~") // 그 외 언제든지 실행됩니다.
}  // Hello yagom!!!

for _ in 0..<2 {
    print("Hello")
}
// Hello
// Hello
