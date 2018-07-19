import Swift

// 코드 부록-3 디버깅 식별자의 사용
func printDebugInfo() {
    
    print("\(#file) 파일의 \(#line)번 줄, \(#column)번 칸이고, \(#function) 함수 안에서 실행되고 있습니다.")
    
}

printDebugInfo()
// example.swift 파일의 10번 줄, 50번 칸이고, printDebugInfo() 함수 안에서 실행되고 있습니다.

