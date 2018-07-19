import Swift

// 코드 11-7 Point 구조체와 Size 구조체의 선언과 멤버와이즈 이니셜라이저의 사용
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

