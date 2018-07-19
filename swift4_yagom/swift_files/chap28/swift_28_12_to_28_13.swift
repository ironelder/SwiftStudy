import Swift

// 코드 28-12 defer 구문의 실행 순서
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
        print("Second")
    }
    
    defer {
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction(shouldThrowError: true)
// First
// 오류를 던지기 직전까지 작성된 defer 구문까지만 실행됩니다.

try? someThrowingFunction(shouldThrowError: false)
// Third
// Second
// First



// 코드 28-13 복합적인 defer 구문의 실행 순서
func someFunction() {
    print("1")
    
    defer {
        print("2")
    }
    
    do {
        defer {
            print("3")
        }
        print("4")
    }
    
    defer {
        print("5")
    }
    
    print("6")
}

someFunction()


// 1
// 4
// 3
// 6
// 5
// 2
