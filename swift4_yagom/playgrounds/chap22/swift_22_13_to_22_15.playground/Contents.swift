import Swift

// 코드 22-13 substractTwoValue 함수의 잘못된 구현
func substractTwoValue<T>(_ a: T, _ b: T) -> T {
    return a - b
}

// 코드 22-14 substractTwoValue 함수의 구현
func substractTwoValue<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}


// 코드 22-15 makeDictionaryWithTwoValue 함수의 구현
func makeDictionaryWithTwoValue<Key: Hashable, Value>(key: Key, value: Value) -> Dictionary<Key, Value> {
    
    let dictionary: Dictionary<Key, Value> = [key:value]
    return dictionary
}

