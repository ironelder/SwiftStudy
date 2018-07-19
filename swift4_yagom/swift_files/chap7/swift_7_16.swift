import Swift

// 코드 7-16 비반환 함수의 정의와 사용
func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

crashAndBurn()  // 프로세스 종료 후 오류 보고

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)     // All is well
someFunction(isAllIsWell: false)    // 마을에 도둑이 들었습니다!
// 프로세스 종료 후 오류 보고
