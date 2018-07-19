import Swift

class Person {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

// 코드 27-5 강한참조 순환 문제를 수동으로 해결
var yagom: Person? = Person(name: "yagom")  // Person 인스턴스의 참조 횟수 : 1
var room: Room? = Room(number: "505")   // Room 인스턴스의 참조 횟수 : 1

room?.host = yagom  // Person 인스턴스의 참조 횟수 : 2
yagom?.room = room  // Room 인스턴스의 참조 횟수 : 2

yagom?.room = nil   // Room 인스턴스의 참조 횟수 : 1
yagom = nil // Person 인스턴스의 참조 횟수 : 1

room?.host = nil    // Person 인스턴스의 참조 횟수 : 0
// yagom is being deinitialized

room = nil  // Room 인스턴스의 참조 횟수 : 0
// Room 505 is being deinitialized

