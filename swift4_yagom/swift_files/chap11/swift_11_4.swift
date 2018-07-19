import Swift

// 코드 11-4 이니셜라이저 매개변수
struct Area {
    var squareMeter: Double
    
    init(fromPy py: Double) { 			// 첫 번째 이니셜라이저
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {	// 두 번째 이니셜라이저
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {				// 세 번째 이니셜라이저
        squareMeter = value
    }
    
    init(_ value: Double) {             // 네 번째 이니셜라이저
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter) // 49.587

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter) // 33.06

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)

Area()  // 오류 발생!!
