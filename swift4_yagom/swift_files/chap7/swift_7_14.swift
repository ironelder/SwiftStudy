import Swift

// 코드 7-14 원점으로 이동하기 위한 함수
typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3   // 현위치
let moveToZero: MoveFunc = functionForMove(position > 0)
// 현위치가 0보다 크므로 전달되는 인자 값은 true가 됩니다.
// 그러므로 goLeft(_:) 함수가 할당될 것입니다.

print("원점으로 갑시다")

while position != 0 {    // 원점에 도착하면(현위치가 0이면) 반복문이 종료됩니다.
    print("\(position)... ")
    position = moveToZero(position)
}
print("원점 도착!")
// 3...
// 2...
// 1...
// 원점 도착!


