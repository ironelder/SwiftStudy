import Swift

// 코드 19-1 C 언어와 스위프트의 데이터 타입 변환 비교

/*
// C 언어
double value = 3.3
int convertedValue = (int)value
convertedValue = 5.5		// double -> int 암시적 데이터 타입 변환
*/

// 스위프트
var value: Double = 3.3
var convertedValue: Int = Int(value)
convertedValue = 5.5		// 오류!!

