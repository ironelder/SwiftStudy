import Swift

// 코드 7-17 반환 값을 무시할 수 있는 함수
func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discadableResultSay(_ something: String) -> String {
    print(something)
    return something
}

// 반환 값을 사용하지 않았기 때문에 컴파일러가 경고를 표시할 수 있습니다.
say("hello")    // hello

// 반환 값을 사용하지 않을 수도 있다고 미리 알렸기 때문에
// 반환 값을 사용하지 않아도 컴파일러가 경고하지 않습니다
discadableResultSay("hello")    // hello


