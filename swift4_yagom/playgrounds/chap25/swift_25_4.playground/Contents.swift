import Swift

// 코드 25-4 튜플 패턴의 사용
let (a): Int = 2
print(a)    // 2

let (x, y): (Int, Int) = (1, 2)
print(x)    // 1
print(y)    // 2

let name: String = "Jung"
let age: Int = 99
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _): print("Hello Jung!!")
case (_, _, "Male"?): print("Who are you man?")
default: print("I don't know who you are")
}    // Hello Jung!!

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points {
    print(x)
}
// 0
// 1
// 1
// 2
// 2
