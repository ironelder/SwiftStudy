import Swift

// 코드 9-6 값 타입과 참조 타입의 차이
struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

var friendInfo: BasicInformation = yagomInfo    // yagomInfo의 값을 복사하여 할당합니다!

print("yagom's age : \(yagomInfo.age)")         // 100
print("friend's age : \(friendInfo.age)")       // 100

friendInfo.age = 999

print("yagom's age : \(yagomInfo.age)")         // 100 - yagom의 값은 변동 없습니다.
print("friend's age : \(friendInfo.age)")
// 999 - friendInfo는 yagomInfo의 값을 복사해왔기 때문에 별개의 값을 갖습니다.


class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()

var friend: Person = yagom                      // yagom의 참조를 할당합니다!

print("yagom's height : \(yagom.height)")       // 0.0
print("friend's height : \(friend.height)")     // 0.0

friend.height = 185.5

print("yagom's height : \(yagom.height)")
// 185.5 - friend는 yagom을 참조하기 때문에 값이 변동됩니다.
print("friend's height : \(friend.height)")
// 185.5 - 이를 통해 yagom이 참조하는 곳과 friend가 참조하는 곳이 같음을 알 수 있습니다.

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

// changeBaiscInfo(_:)로 전달되는 전달인자는 값이 복사되어 전달되기 때문에 yagomInfo의 값만 전달되는 것입니다.
changeBasicInfo(yagomInfo)
print("yagom's age : \(yagomInfo.age)")         // 100

// changePersonInfo(_:)의 전달인자로 yagom의 참조가 전달되었기 때문에 yagom이 참조하고 있는 값들에 변화가 생깁니다.
changePersonInfo(yagom)
print("yagom's height : \(yagom.height)")         // 155.3


