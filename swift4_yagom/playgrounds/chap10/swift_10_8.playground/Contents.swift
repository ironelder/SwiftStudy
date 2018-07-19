import Swift

// 코드 10-8 읽기 전용 연산 프로퍼티
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint {    // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

// 현재 좌표
print(yagomPosition)    // 10, 20

// 대칭 좌표
print(yagomPosition.oppositePoint)  // -10, -20

// 설정자를 구현하지 않았으므로 오류!!
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)

