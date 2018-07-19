import Swift

// 코드 부록-4 조건부 컴파일 블럭의 사용
#if os(Linux)
print("이 프로그램은 리눅스 환경을 위해 빌드했습니다.")
#elseif os(macOS)
print("이 프로그램은 macOS 환경을 위해 빌드했습니다.")
#elseif os(iOS)
print("이 프로그램은 iOS 환경을 위해 빌드했습니다.")
#else
print("플랫폼을 인식할 수 없습니다.")
#endif

#if DEBUG
print("DEBUG 환경으로 빌드했습니다.")
#elseif TEST_RELEASE
print("TEST RELEASE 환경으로 빌드했습니다.")
#else
print("RELEASE 환경으로 빌드했습니다.")
#endif

#if swift(>=3.0)
print("Swift 3.0과 같거나 높은 버전의 환경에서 빌드했습니다.")
#elseif swift(>=2.0)
print("Swift 2.0과 같거나 높은 버전의 환경에서 빌드했습니다.")
#else
    print("Swift 2.0미만의 버전의 환경에서 빌드했습니다.")
#endif

#if os(macOS) && swift(>=2.0)
print("macOS를 위해 Swift 2.0과 같거나 높은 버전의 환경에서 빌드했습니다.")
#elseif os(Linux) || swift(>=3.0)
print("Linux를 위해 빌드되었거나 Swift 3.0과 같거나 높은 버전의 환경에서 빌드했습니다.")
#endif



// 코드 부록-5 스위프트 버전 체크 조건부 컴파일 블록의 사용
var i: Int = 0

#if swift(>=2.2)
i += 1
#else
    i++
#endif

print(i)    // 1

