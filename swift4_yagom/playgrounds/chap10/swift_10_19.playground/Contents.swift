import Swift

// 코드 10-16 self 프로퍼티의 사용
class LevelClass {
    var level: Int = 0
    
    func jumpLevel(level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
}

