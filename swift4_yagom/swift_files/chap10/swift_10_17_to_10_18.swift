import Swift

// 코드 10-17 클래스의 인스턴스 메서드
class LevelClass {
    // 현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        // 프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(level)")
        }
    }
    
    // 레벨이 올랐을 때 호출할 메서드
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    // 특정 레벨로 이동할 때 호출할 메서드
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    // 레벨을 초기화 할 때 호출할 메서드
    func reset() {
        print("Reset!")
        level = 0
    }
}


var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()        // Level Up!
// Level 1
levelClassInstance.levelDown()      // Level Down
// Level 0
levelClassInstance.levelDown()      // Level Down
// Level -1
// Reset!
// Level 0
levelClassInstance.jumpLevel(to: 3)   // Jump to 3
// Level 3



// 코드 10-18 mutating 키워드의 사용
struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("Reset!")
        level = 0
    }
}


var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()        // Level Up!
// Level 1
levelStructInstance.levelDown()      // Level Down
// Level 0
levelStructInstance.levelDown()      // Level Down
// Level -1
// Reset!
// Level 0
levelStructInstance.jumpLevel(to: 3)   // Jump to 3
// Level 3


