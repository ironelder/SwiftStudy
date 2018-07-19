import Swift

// 코드 23-11 SelfPrintable 프로토콜의 초기구현과 기본 타입의 확장
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable {
    func printSelf() {
        print(self)
    }
}

extension Int: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

1024.printSelf()    // 1024
3.14.printSelf()    // 3.14
"hana".printSelf()  // "hana"
