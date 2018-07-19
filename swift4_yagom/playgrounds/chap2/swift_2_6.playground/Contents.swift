import Swift

// 코드 2-6 변수의 선언 및 사용
var name: String = "yagom"
var age: Int = 100
var job = "iOS Programmer"	// 타입 추론이 사용되었습니다.
var height = 181.5          // 실수 타입에 타입 추론으로 어떤 타입이 지정되는지 확인해보세요.
// print(“\(type(of:height))”)
age = 99			// 변수는 값을 변경해줄 수 있습니다.
job = "Writer"		// 값을 변경할 때는 기존과 같은 타입의 값을 할당해주어야 합니다.
print("저의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 비밀이지만, 키는 \(height)센티미터입니다.")

