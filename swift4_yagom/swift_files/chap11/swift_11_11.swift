import Swift

// 코드 11-11 클로저를 통한 프로퍼티 기본값 설정
class SomeClass {
    let someProperty: SomeType = {
        // 새로운 인스턴스를 생성하고 사용자정의 연산을 통한 후 반환해줍니다.
        // 반환되는 값의 타입은 SomeType과 같은 타입이어야 합니다.
        return someValue
    }()	
}


