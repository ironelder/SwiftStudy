import Swift

// 코드 28-8 다시던지기 함수의 오류 던지기
// 오류를 던지는 함수
func someThrowingFunction() throws {
    
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

// 다시던지기 함수
func someFunction(callback: () throws -> Void) rethrows {
    
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        // 매개변수로 전달한 오류 던지기 함수이므로
        // catch에서 제어할 수 있습니다.
        try callback()
    } catch {
        
        throw AnotherError.justAnotherError
    }
    
    do {
        // 매개변수로 전달한 오류 던지기 함수가 아니므로
        // catch에서 제어할 수 없습니다.
        try someThrowingFunction()
    } catch {
        // 오류 발생!
        throw AnotherError.justAnotherError
    }
    
    // catch 절 외부에서 단독으로 오류를 던질 수는 없습니다. 오류 발생!
    throw AnotherError.justAnotherError
}


