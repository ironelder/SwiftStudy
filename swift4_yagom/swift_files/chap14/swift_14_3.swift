import Swift

// 코드 14-1 사람의 주소정보 표현 설계
class Room {    // 호실
    var number: Int             // 호실 번호

    init(number: Int) {
        self.number = number
    }
}

class Building {    // 건물
    var name: String           // 건물이름
    var room: Room?	   // 호실정보

    init(name: String) {
        self.name = name
    }
}

struct Address {    // 주소
    var province: String        // 광역시/도
    var city: String            // 시/군/구
    var street: String          // 도로명
    var building: Building?     // 건물
    var detailAddress: String?  // 건물 외 상세주소
}

class Person {  // 사람
    var name: String            // 이름
    var address: Address?       // 주소
    
    init(name: String) {
        self.name = name
    }
}


// 코드 14-2 yagom 인스턴스 생성
let yagom: Person = Person(name: "yagom")

// 코드 14-3 옵셔널 체이닝 문법
let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number  // nil
/*
let yagomRoomViaOptionalUnwraping: Int = yagom.address!.building!.room!.number  // 오류 발생!!
*/