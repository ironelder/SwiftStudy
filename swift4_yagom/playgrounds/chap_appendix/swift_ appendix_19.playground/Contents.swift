import Foundation

// 코드 부록-19 Codable, JSONEncoder, JSONDecoder의 활용
/// Encodable과 Decodable 프로토콜을 준수하는 타입 Person
struct Person: Codable {
    /// Encodable과 Decodable 프로토콜을 준수하는 타입 Gender
    enum Gender: String, Codable {
        case male, female, unknown
    }
    
    var name: String
    var age: Int
    var gender: Gender
    var friends: [Person]
}

let yagom = Person(name: "yagom", age: 20, gender: .male, friends: [])
let hana = Person(name: "hana", age: 22, gender: .female, friends: [yagom])
let eric = Person(name: "eric", age: 25, gender: .male, friends: [yagom, hana])

// JSONEncoder 인스턴스 생성
var encoder = JSONEncoder()

// JSONEncoder를 활용하여 Person 타입의 eric 인스턴스를 JSON 문자열로 인코딩
let jsonData = try encoder.encode(eric)
let jsonString = String(data: jsonData, encoding: .utf8)
print(jsonString ?? "convert to json string failed")
// "{\"age\":25,\"gender\":\"male\",\"friends\":[{\"age\":20,\"gender\":\"male\",
// \"friends\":[],\"name\":\"yagom\"},{\"age\":22,\"gender\":\"female\",\"friends\
// ":[{\"age\":20,\"gender\":\"male\",\"friends\":[],\"name\":\"yagom\"}],\"name\"
// :\"hana\"}],\"name\":\"eric\"}"

// JSONDecoder를 활용하여 JSON 문자열을 Person 타입의 인스턴스로 디코딩
let decoder = JSONDecoder()
let decoded: Person = try decoder.decode(Person.self, from: jsonData)
print(decoded.name) // eric
