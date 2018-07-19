import Swift

// 코드 11-3 프로퍼티 기본값 지정
struct Area {
    var squareMeter: Double = 0.0 // 프로퍼티 기본값 할당
}

let room: Area = Area()
print(room.squareMeter) // 0.0

