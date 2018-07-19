import Foundation

// 코드 부록-15 objc 속성과 상속
// 오류 - Objective-C의 클래스를 상속받지 않았습니다.
@objc
class SomeClass {}

// Objective-C의 클래스를 상속받으면 암시적으로 @objc 속성이 부여됩니다.
class AnotherClass: NSObject {}


protocol ParentProtocol {}

@objc   // 오류 - ParentProtocol은 objc 속성이 없습니다.
protocol SomeProtocol: ParentProtocol { }


// 코드 부록-16 objc 열거형의 Objective-C 이름
@objc
enum Planet: Int {
    case mercury, venus, earth, mars, jupiter
    // Objective-C 이름
    // PlanetMercury, PlanetVenus, PlanetEarth, PlanetMars, PlanetJupiter
}

// 코드 부록-17 objc 속성에 Objective-C 이름 부여
@objc(Example) // Objective-C 코드에서는 ExampleClass 클래스의 이름이 Example이라고 보입니다.
class ExampleClass: NSObject {
    var enabled: Bool {
        // Objective-C 코드에서는 enabled 프로퍼티의 이름이 isEnabled라고 보입니다.
        @objc(isEnabled) get {
            return true
        }
    }
    
    // Objective-C 코드에서는 print(name:) 메서드의 이름이 printWithName:이라고 보입니다.
    @objc(printWithName:)
    func print(name: String) {    }
    
    // Objective-C 코드에서는 init(name:) 이니셜라이저의 이름이 initWithName:이라고 보입니다.
    @objc(initWithName:)
    init(name: String) {    }
}
