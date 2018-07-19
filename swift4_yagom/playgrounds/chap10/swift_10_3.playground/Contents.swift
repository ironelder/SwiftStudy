import Swift

// 코드 10-3 옵셔널 저장 프로퍼티
// 좌표
struct CoordinatePoint {
    // 위치는 x, y 값을 모두 가져야 하므로 옵셔널이면 안 됩니다.
    var x: Int
    var y: Int
}

// 사람의 위치정보
class Position {
    var point: CoordinatePoint?     // 현재 사람의 위치를 모를 수도 있습니다. - 옵셔널
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있습니다.
let yagomPosition: Position = Position(name: "yagom")

// 위치를 알게되면 그 때 위치 값을 할당해줍니다.
yagomPosition.point = CoordinatePoint(x: 20, y: 10)

