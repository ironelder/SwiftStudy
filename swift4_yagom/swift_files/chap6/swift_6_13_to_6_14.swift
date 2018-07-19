import Swift

// 코드 6-13 for-in 반복 구문의 활용
for i in 0...2 {
    print(i)
}

// 0
// 1
// 2


for i in 0...5 {
    
    if i % 2 == 0 {
        print(i)
        continue    // continue 키워드를 사용하면 바로 다음 시퀀스로 건너뜁니다.
    }
    
    print("\(i) == 홀수")
}

//0
//1 == 홀수
//2
//3 == 홀수
//4
//5 == 홀수


let helloSwift: String = "Hello Swift!"

for char in helloSwift.characters {
    print(char)
}


var result: Int = 1

// 시퀀스에 해당하는 값이 필요 없다면 와일드카드 식별자(_)를 사용하면 됩니다.
for _ in 1...3 {
    result *= 10
}

print("10의 3제곱은 \(result)입니다.")

// 10의 3제곱은 1000입니다.


// 코드 6-14 기본 데이터 타입의 for-in 반복 구문 사용
// Dictionary
let friends: [String: Int] = ["Jay":35, "Joe":29, "Jenny":31]

for tuple in friends {
    print(tuple)
}
// ("Joe", 29)
// ("Jay", 35)
// ("Jenny", 31)

let 주소: [String: String] = ["도":"충청북도", "시군구":"청주시 청원구", "동읍면":"율량동"]

for (키, 값) in 주소 {
    print("\(키) : \(값)")
}
// 도 : 충청북도
// 동읍면 : 율량동
// 시군구 : 청주시 청원구

// Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064"]

for 번호 in 지역번호 {
    print(번호)
}

// 02
// 031
// 032
// ...


