import Swift
import Foundation

// 코드 부록-18 convention 속성 사용
// 전역변수
var someGlobalInstance: NSObject = NSObject()

func swiftParamFunction(_ param: @convention(swift) () -> Void) { param() }

func blockParamFunction(_ param: @convention(block) () -> Void) { param() }

func cParamFunction(_ param: @convention(c) () -> Void) { param() }

swiftParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }
blockParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }

// 오류: 전역변수를 획득하는 클로저는 C 언어 함수 호출 방식으로 사용할 수 없습니다.
cParamFunction{ [someGlobalInstance] in print(someGlobalInstance) }

let someSwiftClosure: @convention(swift) () -> Void = { [someGlobalInstance] in print(someGlobalInstance) }

let someBlock: @convention(block) () -> Void = { [someGlobalInstance] in print(someGlobalInstance) }

// 오류: 전역변수를 획득하는 클로저는 C 언어 함수 호출 방식으로 사용할 수 없습니다.
let someCFunction: @convention(c) () -> Void = { [someGlobalInstance] in print(someGlobalInstance) }
