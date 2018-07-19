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

// 코드 14-8 옵셔널 체이닝을 통한 메서드 호출
struct Address {    // 주소
    var province: String        // 광역시/도
    var city: String            // 시/군/구
    var street: String          // 도로명
    var building: Building?     // 건물
    var detailAddress: String?  // 건물 외 상세주소
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            
            restAddress = buildingInfo.name
            
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

class Person {  // 사람
    var name: String            // 이름
    var address: Address?       // 주소
    
    init(name: String) {
        self.name = name
    }
}

// 코드 14-5 옵셔널 체이닝의 사용
let yagom: Person = Person(name: "yagom")

// 코드 14-7 옵셔널 체이닝을 통한 값 할당
yagom.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로")
yagom.address?.building = Building(name: "곰굴")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

// 코드 14-8 옵셔널 체이닝을 통한 메서드 호출
yagom.address?.fullAddress()?.isEmpty   // false
yagom.address?.printAddress()           // 충청북도 청주시 청원구 충청대로 곰굴
