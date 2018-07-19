import Swift

protocol Readable {
    func read()
}

protocol Writeable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {
    func speak()
}


// 코드 20-13 클래스 전용 프로토콜의 정의
protocol ClassOnlyProtocol: class, Readable, Writeable {
    // 추가 요구사항
}

class SomeClass: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

// 오류!! ClassOnlyProtocol 프로토콜은 클래스 타입에만 채택 가능합니다.
struct SomeStruct: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

