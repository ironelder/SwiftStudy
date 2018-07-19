import Swift

class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [unowned self] in
        
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        
        introduction += "My hobby is \(hobby)."
        
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

// 코드 27-14 획득목록의 미소유참조로 인한 차후 접근 문제 발생
var yagom: Person? = Person(name: "yagom", hobby: "eating")
var hana: Person? = Person(name: "hana", hobby: "playing guitar")

// hana의 introduce 프로퍼티에 yagom의 introudce 프로퍼티 클로저의 참조 할당
hana?.introduce = yagom?.introduce ?? {" "}

// 아직 yagom이 참조하는 인스턴스가 해제되지 않았기 때문에
// 클로저 내부에서 self(yagom 변수가 참조하는 인스턴스) 참조 가능
print(yagom?.introduce())   // My name is yagom. My hobby is eating.

yagom = nil // yagom is being deinitialized

print(hana?.introduce())   // 오류 발생! 이미 메모리에서 해제된 인스턴스(yagom) 참조 시도

