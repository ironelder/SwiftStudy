import Swift

// 코드 26-5 where 절을 활용한 프로토콜 익스텐션의 프로토콜 준수 제약 추가
protocol SelfPrintable {
    func printSelf()
}

struct Person: SelfPrintable { }

extension Int: SelfPrintable { }
extension UInt: SelfPrintable { }
extension String: SelfPrintable { }
extension Double: SelfPrintable { }

extension SelfPrintable where Self: BinaryInteger, Self: Comparable {
    func printSelf() {
        print("BinaryInteger와 Comparable을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of:self))")
    }
}

extension SelfPrintable where Self: CustomStringConvertible {
    func printSelf() {
        print("CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 타입 \(type(of:self))")
    }
}

extension SelfPrintable {
    func printSelf() {
        print("그 외 SelfPrintable을 준수하는 타입 \(type(of:self))")
    }
}

Int(-8).printSelf()         // BinaryInteger와 Comparable을 준수하면서 SelfPrintable을 준수하는 Int 타입
UInt(8).printSelf()         // BinaryInteger와 Comparable을 준수하면서 SelfPrintable을 준수하는 UInt 타입
String("yagom").printSelf() // CustomStringConvertible을 준수하면서 SelfPrintable을 준수하는 String 타입
Double(8.0).printSelf()     // 그 외 SelfPrintable을 준수하는 타입 Double
Person().printSelf()        // 그 외 SelfPrintable을 준수하는 타입 Person()

