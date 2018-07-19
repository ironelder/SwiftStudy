import Swift

// 코드 10-5 메서드로 구현된 접근자와 설정자
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭점을 구하는 메서드 - 접근자
    func oppositePoint() -> CoordinatePoint {
        return CoordinatePoint(x: -x, y: -y)
    }
    
    // 대칭점을 설정하는 메서드 - 설정자
    // mutating 키워드에 관한 내용은 메서드(205쪽)에서 다룹니다.
    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

// 현재 좌표
print(yagomPosition)    // 10, 20

// 대칭 좌표
print(yagomPosition.oppositePoint())  // -10, -20

// 대칭 좌표를 (15, 10)으로 설정하면
yagomPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))

// 현재 좌표는 -15, -10으로 설정됩니다.
print(yagomPosition)    // -15, -10


