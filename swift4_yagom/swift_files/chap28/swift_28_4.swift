import Swift

// 코드 28-4 옵셔널 값으로 오류를 처리
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    
    if shouldThrowError {
        
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x)    // nil

let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y)    // Optional(100)




