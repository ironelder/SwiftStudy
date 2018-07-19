import Swift


// 코드 4-3 튜플 기본
var person: (String, Int, Double) = ("yagom", 100, 182.5)   // String, Int, Double 타입을 갖는 튜플

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")  // 인덱스를 통해서 값을 빼 올 수 있습니다.

person.1 = 99           // 인덱스를 통해 값을 할당할 수 있습니다.
person.2 = 178.5

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

