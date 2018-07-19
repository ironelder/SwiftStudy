import Swift

// 코드 10-20 self 프로퍼티와 mutating 키워드
class LevelClass {
    var level: Int = 0
    
    func reset() {
        // 오류!! self 프로퍼티 참조 변경 불가!
        self = LevelClass()
    }
}

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()        // Level Up!
// Level 1
levelStructInstance.reset()         // Reset!
print(levelStructInstance.level)    // 0

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)   // on


