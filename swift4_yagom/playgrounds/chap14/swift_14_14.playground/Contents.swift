import Swift

// 코드 14-14 guard 구문이 사용될 수 없는 경우
let first: Int = 3
let second: Int = 5

guard first > second else {
    // 여기에 들어올 제어문 전환 명령은 딱히 없습니다. 오류!
}
