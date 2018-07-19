import Swift

// 코드 11-8 Student 열거형과 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있습니다.
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {			// 첫 번째 사용자정의 이니셜라이저
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {	// 두 번째 사용자정의 이니셜라이저
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)  // middle

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)  // high


