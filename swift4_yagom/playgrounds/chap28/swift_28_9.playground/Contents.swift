import Swift

// 코드 28-9 프로토콜과 상속에서 던지기 함수와 다시던지기 함수
protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws {    }
    func someFunction(callback: () throws -> Void) rethrows { }
    
    // 던지기 메서드는 다시던지기 메서드를 요구하는 프로토콜을 충족할 수 없습니다. 오류 발생!
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws {    }
    
    // 다시던지기 메서드는 던지기 메서드를 요구하는 프로토콜의 요구사항에 부합합니다.
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {    }
}

class SomeChildClass: SomeClass {
    // 부모클래스의 던지기 메서드는 자식클래스에서 다시던지기 메서드로 재정의할 수 있습니다.
    override func someThrowingFunction(callback: () throws -> Void) rethrows {    }
    
    // 부모클래스의 다시던지기 메서드는 자식클래스에서 던지기 메서드로 재정의할 수 없습니다. 오류 발생!
    override func someFunction(callback: () throws -> Void) throws { }
}

