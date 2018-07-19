import Swift

// 코드 9-1 BasicInformation 구조체 정의
struct BasicInformation {
    var name: String
    var age: Int
}

// 코드 9-2 BasicInformation 구조체의 인스턴스 생성 및 사용
// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100         // 변경 가능
yagomInfo.name = "Seba"     // 변경 가능!

// 프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
sebaInfo.age = 100 // 변경 불가! 오류!
jennyInfo.age = 100 // 변경 불가!