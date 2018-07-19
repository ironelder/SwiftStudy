import Swift

// 코드 27-11 참조 타입의 획득목록 동작
class SimpleClass {
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()
let closure = { [x] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10

closure()		// 10 10

