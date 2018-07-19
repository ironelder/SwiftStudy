import Swift

// 코드 10-7 매개변수 이름을 생략한 설정자
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {    // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        // 설정자
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}
