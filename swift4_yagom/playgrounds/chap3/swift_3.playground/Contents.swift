import Swift

// 코드 3-1 Int와 UInt
var integer: Int = -100
let unsignedInteger: UInt = 50	// UInt 타입에는 음수값을 할당할 수 없습니다.
print("integer 값: \(integer), unsignedInteger의 값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")

let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max 
print("Int64 최댓값 : \(largeInteger), UInt8 최댓값 : \(smallUnsignedInteger)")

let tooLarge: Int = Int.max + 1	// Int의 표현 범위를 초과하므로 오류를 냅니다.
let cannotBeNegetive: UInt = -5	// UInt는 음수가 될 수 없으므로 오류를 냅니다.

integer = unsignedInteger   	// 오류! 스위프트에서 Int와 UInt는 다른 타입입니다.
integer = Int(unsignedInteger)   	// Int 타입의 값으로 할당해주어야 합니다.

// 코드 3-2 진수별 정수 표현
let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100       // 2진수로 10진수 28을 표현합니다.
let octalInteger: Int = 0o34           // 8진수로 10진수 28을 표현합니다.
let hexadecimalInteger: Int = 0x1C     // 16진수로 10진수 28을 표현합니다.

// 코드 3-3 Bool
let boolean: Bool = true
let iLoveYou: Bool = true
let isTimeUnlimited: Bool = false
print("시간은 무한합니까?: \(isTimeUnlimited)")


// 코드 3-4 Float과 Double
var floatValue: Float = 1234567890.1        // Float이 수용할 수 있는 범위를 넘어섭니다.
//자신이 감당할 수 있는 만큼만 남기므로 정확도가 떨어집니다.
let doubleValue: Double = 1234567890.1      // Double은 충분히 수용할 수 있습니다.

print("floatValue : \(floatValue) doubleValue : \(doubleValue)")

floatValue = 123456.1                       // Float이 수용할 수 있는 범위의 수로 변경합니다.

print(floatValue)			// 문자열 보간법을 사용하지 않고
// 단순히 변수 또는 상수의 값만 보고 싶으면
// print 함수의 전달인자로 변수 또는 상수를 전달하면 됩니다.

// 코드 3-5 Character
let alphabetA: Character = "A"
print(alphabetA)

let commandCharacter: Character = "♡"	// Character 값에 유니코드 문자를 사용할 수 있습니다.
print(commandCharacter)

let 한글변수이름: Character = "ㄱ"		// 한글도 유니코드 문자에 속하므로 스위프트 코드의 변수 이름으로 사용할 수 있습니다.
print("한글의 첫 자음: \(한글변수이름)")


// 코드 3-6 String
let name: String = "yagom"  // 상수로 선언된 문자열은 변경이 불가능합니다.

// 이니셜라이저를 사용하여 빈 문자열을 생성할 수 있습니다.
// var 키워드를 사용하여 변수를 생성했으므로 문자열의 수정 및 변경이 가능합니다.
var introduce: String = String()

introduce.append("제 이름은")     // append() 메서드를 사용하여 문자열을 이어붙일 수 있습니다.
introduce = introduce + " " + name + "입니다." 	// + 연산자를 통해서도 문자열을 이어붙일 수 있습니다.

print(introduce)

print("name의 글자 수 : \(name.count)")   // name에 해당하는 문자의 수를 셀 수 있습니다.
print("introduce가 비어있는가? : \(introduce.isEmpty)")       // 빈 문자열인지 확인해볼 수 있습니다.

let unicodeScalarValue: String = "\u{2665}"      // 유니코드의 스칼라값을 사용하면 값에 해당하는 표현이 출력됩니다 - 어떤 모양이 출력되나요?


// 코드 3-7 String 타입의 다양한 기능
// 연산자를 통한 문자열 결합
let hello: String = "Hello"
let yagom: String = "yagom"
var greeting: String = hello + " " + yagom + "!"
print(greeting) // Hello yagom!

greeting = hello
greeting += " "
greeting += yagom
greeting += "!"
print(greeting) // Hello yagom!

// 연산자를 통한 문자열 비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) // true

isSameString = hello == "hello"
print(isSameString) // false

isSameString = yagom == "yagom"
print(isSameString) // true

isSameString = yagom == hello
print(isSameString) // false

// 메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix) // true

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix) // false

hasPrefix = greeting.hasPrefix("Hello ")
print(hasPrefix) // true

hasPrefix = yagom.hasPrefix("gom")
print(hasPrefix) // false

hasPrefix = hello.hasPrefix("Hello")
print(hasPrefix) // true

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("He")
print(hasSuffix) // false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix) // true

hasSuffix = hello.hasSuffix("He")
print(hasSuffix) // false

hasSuffix = greeting.hasSuffix("yagom")
print(hasSuffix) // false

hasSuffix = greeting.hasSuffix("yagom!")
print(hasSuffix) // true

hasSuffix = yagom.hasSuffix("gom")
print(hasSuffix) // true

// 메서드를 통한 대소문자 변환
var convertedString: String = ""
convertedString = hello.uppercased()
print(convertedString)  // HELLO

convertedString = hello.lowercased()
print(convertedString)  // hello

convertedString = yagom.uppercased()
print(convertedString)  // YAGOM

convertedString = greeting.uppercased()
print(convertedString)  // HELLO YAGOM!

convertedString = greeting.lowercased()
print(convertedString)  // hello yagom!

// 프로퍼티를 통한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) // false

greeting = "안녕"
isEmptyString = greeting.isEmpty
print(isEmptyString) // false

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString) // true


// 프로퍼티를 이용해 문자열 길이 확인
print(greeting.count) // 0

greeting = "안녕하세요"
print(greeting.count) // 5

greeting = "안녕!"
print(greeting.count) // 3


// 코드상에서 여러 줄의 문자열을 직접 쓰고 싶다면 큰따옴표 세 개를 사용하면 됩니다.
// 큰따옴표 세 개를 써주고 한 줄을 내려써야 합니다.
// 마지막 줄도 큰따옴표 세 개는 한 줄 내려써야 합니다.

greeting = """
안녕하세요 저는 야곰입니다.
스위프트 잘하고 싶어요!
잘 부탁합니다!
"""


// 코드 3-8 문자열 내 특수문자 사용
print("문자열 내부에\n 이런 \"특수문자\"를\t사용하면 \\이런 놀라운 결과를 볼 수 있습니다")

// 코드 3-9 Any
var someVar: Any = "yagom"	// Any로 선언된 변수에는 문자열도
someVar = 50				// 정수도
someVar = 100.1				// 실수라도, 어떤 타입의 값이라도 할당할 수 있습니다.
