import Swift

// 코드 27-10 획득목록을 통한 값 획득
var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
    b = 20
}

a = 10
b = 10
closure()	// 0 10
print(b)	// 20

