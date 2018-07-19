import Swift

// 코드 부록-7 사용 가능 조건 사용
if #available(iOS 11, *) {
    print("iOS 11 이상의 버전에서 실행 중입니다.")
} else if #available(iOS 10, *) {
    print("iOS 10 이상의 버전에서 실행 중입니다.")
} else {
    print("iOS 10 미만의 버전에서 실행 중입니다.")
}

if #available(iOS 11.0, macOS 10.13, *) {
    print("iOS 11.0 이상 또는 macOS의 10.13 이상의 버전에서 실행 중입니다.")
} else if #available(watchOS 4.0, *) {
    print("watchOS 4.0 이상의 버전에서 실행 중입니다.")
} else {
    print("그 외 기타 플랫폼")
}

while true {
    guard #available(iOS 9.0, *) else {
        print("iOS 9.0 미만의 버전입니다.")
        break
    }
}


// 코드 부록-8 available 속성의 unavailable 매개변수 사용
@available(tvOS, unavailable)
class SomeClass {}
// tvOS에서 사용할 수 없는 클래스입니다.

// 코드 부록-9 available 속성의 introduced 매개변수 사용
class SomeClass {
    // 이 프로퍼티는 스위프트 4.0에서 작성되었기 때문에
    // 스위프트 4.0 이상에서만 사용할 수 있습니다.
    @available(swift, introduced: 4.0)
    var multilineString: String {
        return """
        여러 줄
        문자열은
        스위프트 4.0 이상에서
        사용할 수 있습니다
        """
    }
}


// 코드 부록-10 available 속성의 deprecated 매개변수 사용
@available(*, deprecated: 2.0.0)
class SomeClass {}
// 이 클래스는 2.0.0 버전부터 사용이 제한되었습니다.


// 코드 부록-11 available 속성의 obsoleted 매개변수 사용
@available(*, obsoleted: 2.0.0)
class SomeClass {}
// 이 클래스는 2.0.0 버전부터 사용이 불가능합니다.


// 코드 부록-12 available 속성의 message 매개변수 사용
@available(*, deprecated: 2.0.0, message: "아마도 쓰지 않는 것이 좋을 걸?")
class SomeClass {}
// 이 클래스는 2.0.0 버전부터 사용이 제한되었습니다.

let instance = SomeClass()  // 컴파일러 경고


// 코드 부록-13 available 속성의 renamed 매개변수 사용
@available(*, deprecated: 2.0.0, message: "아마도 쓰지 않는 것이 좋을 걸?", renamed: "NewClass")
class SomeClass {}
// 이 클래스는 2.0.0 버전부터 사용이 제한되었습니다.

@available(*, unavailable, message: "사용 불가", renamed: "NewClass")
class AnotherClass {}
// 이 클래스는 사용 불가능합니다.

@available(*, introduced: 2.0.0)
class NewClass {}

let someInstance = SomeClass()          // 컴파일러 경고
let anotherInstance = AnotherClass()    // 컴파일러 오류


// 코드 부록-14 available 속성의 여러 플랫폼 한정
@available(iOS 11.0, *)
func someFunction() {}

@available(iOS 11.0, macOS 10.13, watchOS 4.0, *)
func anotherFunction() {}

