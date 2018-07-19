import Swift

// 코드 2-7 상수의 선언 및 사용
let name: String = "yagom"      // 차후 변경되지 않는 값은 상수로 선언합니다.
var age: Int = 100
var job = "iOS Programmer"      // 타입 추론이 사용되었습니다.
let height = 181.5              // 실수 타입은 타입 추론으로 어떤 타입이 지정되는지 확인해보세요.
age = 99             // 변수는 값을 변경할 수 있습니다.
job = "Writer"       // 값을 변경할 때는 기존과 동일한 타입의 값을 할당해야 합니다.
name = "야곰"         // 상수로 선언된 값은 변경할 수 없습니다. 오류가 발생합니다.
print("저의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 비밀이지만, 키는 \(height)센티미터입니다.")



