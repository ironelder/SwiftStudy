import Swift

typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}


// 코드 7-15 중첩 함수의 사용
func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4   // 현위치
let moveToZero: MoveFunc = functionForMove(position > 0)
// 현위치가 0보다 작으므로 전달되는 인자 값은 false가 됩니다.
// 그러므로 goRight(_:) 함수가 할당될 것입니다.

while position != 0 {    // 원점에 도착하면(현위치가 0이면) 반복문이 종료됩니다.
    print("\(position)... ")
    position = moveToZero(position)
}
print("원점 도착!")
// -4...
// -3...
// -2...
// -1...
// 원점 도착!

