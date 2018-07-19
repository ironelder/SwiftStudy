import Swift

// 코드 27-9 클로저의 강한참조 순환 문제
class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = {
        
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

var yagom: Person? = Person(name: "yagom", hobby: "eating")

print(yagom?.introduce())   // My name is yagom. My hobby is eating.

yagom = nil

