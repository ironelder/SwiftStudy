import Swift

typealias Data = Int

func fetchDataFromDisk() throws -> Data {
    return Data()
}

func fetchDataFromServer() throws -> Data {
    return Data()
}

// 코드 28-5 옵셔널 값으로 오류를 처리하는 방법과 기존 옵셔널 반환 타입과의 결합
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
