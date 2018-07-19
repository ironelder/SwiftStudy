import Swift

// 코드 28-6 오류가 발생하지 않음을 확신하여 오류처리
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    
    if shouldThrowError {
        
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let y: Int = try! someThrowingFunction(shouldThrowError: false)
print(y)    // 100

let x: Int = try! someThrowingFunction(shouldThrowError: true)	// 런타임 오류!!


