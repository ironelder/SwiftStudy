import Swift

// 코드 28-7 오류의 다시던지기
// 오류를 던지는 함수
func someThrowingFunction() throws {
    
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

// 다시던지기 함수
func someFunction(callback: () throws -> Void) rethrows {
    try callback()   // 다시던지기 함수는 오류를 다시 던질 뿐 따로 처리하지는 않습니다.
}

do {
    try someFunction(callback: someThrowingFunction)
} catch {
    print(error)
}
// justSomeError


