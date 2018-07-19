import Swift

// 코드 22-11 제네릭 타입 제약
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) {
    // 함수 구현
}

struct Stack<Element: Hashable> {
    // 구조체 구현
}


// 코드 22-12 제네릭 타입 제약 추가
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) where T: FloatingPoint, T: Equatable {
    // 함수 구현
}
