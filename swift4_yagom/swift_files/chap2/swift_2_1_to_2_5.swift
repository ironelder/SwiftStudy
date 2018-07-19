import Swift

// 코드 2-1 문자열 보간법 사용
let name: String = "yagom"
print("My name is \(name)")

// 코드 2-2 한 줄 주석
// 한 줄 주석은 이렇게 표현합니다.

// 코드 2-3 여러 줄 주석
/* 여러 줄 주석을 시작할 때는 슬래시와 별표를 사용합니다.
이 줄의 앞에는 별다른 표기가 없지만 이 줄도 주석으로 인식합니다.
주석을 끝내고 싶을 때는 별표를 먼저 쓰면 됩니다. */

/* 
한 줄만 주석을 달아도 무방합니다.
*/

// 코드 2-4 중첩 주석
/* 여러 줄 주석 안쪽에
 /* 추가로 여러 줄 주석을 포함할 수 있으며
 // 그 안에 한 줄 주석을 추가하여도 무방합니다.
 */
 이 부분도 주석처리 됩니다.
*/

// 코드 2-5 퀵헬프를 위한 마크업
/// 오류타입의 열거형입니다.
/// - noName : 이름을 전달받지 못했을 때 발생되는 오류
/// - incorrectAge(age: Int) : 나이가 0세 미만, 150세 초과인 경우 잘못된 나이로 인식하여 오류로 처리
/// - unknown : 알 수 없는 오류
enum HelloError: Error {
    case noName
    case incorrectAge(age: Int)
    case unknown
}

/**
 여기에 작성되는 텍스트는 Description 부분에 표기됩니다.
 
 텍스트 간에 한 줄을 비워놓으면 줄바꿈이 됩니다.
 
 '-', '+', '*'를 사용하여 원형 글머리 기호를 사용할 수 있습니다. 
 
 - 이렇게 말이죠
 + 이렇게도 되구요
 * 이렇게도 됩니다
 
 아니면 번호로 글머리 기호를 매겨줄 수도 있습니다.
 
 1. 1번
 2. 2번
 6. 3번
 
 눈치채셨겠지만 앞에 붙는 번호는 크게 중요하지 않습니다. 자동으로 번호를 매겨주죠.
 
 ----
 문단 바꿈
 
 바를 세 개 이상 사용하면 긴 줄로 문단을 나눠줍니다.
 
 ----
 
 언더바 또는 별표를 사용하여 텍스트를 강조할 수 있습니다.
 
 텍스트를 기울이고 싶으면 *A pair of marks* 를 사용하고

 텍스트를 굵게 표기하고 싶으면 __Two pair of marks__ 를 사용하면 됩니다.
 
 관련 링크도 넣어줄 수 있습니다.
 
 [Swift Blog](https://swift.org/blog/)
 
---
 등호를 사용하면 바로 위 텍스트를 큰 제목으로 표시해줍니다. 텍스트 앞에 #을 하나 붙여줘도 동일한 효과를 냅니다.
 
큰 제목 표시
===
 
 바를 사용하면 바로 위 텍스트를 중간 크기 제목으로 표시해줍니다. 텍스트 앞에 #을 두 개 붙여줘도 동일한 효과를 냅니다.
 
 사용 예
 ----
 
 다른 텍스트보다 네 칸 이상 들여쓰기를 하면 코드 블록을 만들어줍니다. 또한 강세표(Back quote, `)를 세 개 이상 한 쌍으로 묶어도 코드 블록을 만들어 줍니다.
 
     // 코멘트도 넣어줄 수 있지요.
     let myName: String = "yagom"
     try helloSwift(myName, yourAge: 100)
 
 ````
 let myName: String = "yagom"
 try helloSwift(myName, yourAge: 100)
 ````
 
 Precondition, Postcondition, Requires, Invariant, Complexity, Important, Warning, Author, Authors, Copyright, Date, SeeAlso, Since, Version, Attention, Bug, Experiment, Note, Remark, ToDo 등의 키워드를 통해 적절한 정보를 제공해보세요.
 - note : 강조하고픈 메모를 노트로 남겨둘 수 있습니다.
 - author : 작성자를 남길 수 있습니다.
 - warning : 주의해야 할 점을 남길 수도 있습니다. *주의 : 하등 쓸모없는 함수임.
 
 ---
 > 매개변수와 반환 값 등도 적절히 표기해줄 수 있습니다.
 - parameters:
    - yourName: 당신의 이름.
    - yourAge: 당신의 나이. 0미만 또는 150이 초과되면 오류발생
 - Throws: 오류가 발생되면 HelloError의 한 케이스를 throw
 - returns: Hello string
*/
func helloSwift(yourName: String?, yourAge age: Int = 0) throws -> String {
    
    guard let name: String = yourName else {
        throw HelloError.noName
    }
    
    if age > 150 {
        throw HelloError.incorrectAge(age: age)
    }
    
    return "Hello Swift!! My name is \(name)." + (age > 0 ? " I'm \(age) years old." : "")
}
