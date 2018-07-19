import Swift

// 코드 11-2 Area 구조체와 이니셜라이저
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0 // squareMeter의 초깃값 할당
    }
}

let room: Area = Area()
print(room.squareMeter) // 0.0


