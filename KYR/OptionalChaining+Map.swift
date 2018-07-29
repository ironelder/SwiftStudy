//
//  main.swift
//  swiftprogramming
//
//  Created by YurimKim on 2018. 7. 26..
//  Copyright © 2018년 com.study. All rights reserved.
//

import Foundation

///////////////////////////////////////////////////////////////////////////////////////////////
// 옵셔널 체이닝
// - 옵셔널을 반복 사용하여 꼬리를 물고 있는 모양
// - 옵셔널 중 하나라도 값이 존재하지 않으면 nil
///////////////////////////////////////////////////////////////////////////////////////////////
class Person {
    var name: String
    var job: String?
    var home: Apartment?
    
    init(name: String) {
        self.name = name
    }
}

class Apartment {
    var buildingNumber: String
    var roomNumber: String
    var aptGuard: Person?
    var owner: Person?
    
    init(dong: String, ho: String) {
        buildingNumber  = dong
        roomNumber      = ho
    }
}

func guardJob(owner: Person?) {
    if let owner = owner {
        if let home = owner.home {
            if let aptGuard = home.aptGuard {
                if let job = aptGuard.job {
                    print("우리집 경비원 직업은 \(job)입니다.")
                }
                else {
                    print("우리집 경비원 직업은 직업이 없어요")
                }
            }
        }
    }
}

// ==> 옵셔널 체이닝 사용

func guardJobWithOptionalChaining(owner: Person?) {
    if let guardJob = owner?.home?.aptGuard?.job {
        print("[옵셔널 체이닝] 우리집 경비원 직업은 \(guardJob)입니다.")
    }
    else {
        print("[옵셔널 체이닝] 우리집 경비원 직업은 직업이 없어요")
    }
}

let yagom: Person? = Person(name: "yagom")
let apart: Apartment? = Apartment(dong: "101", ho: "202")
let superman: Person? = Person(name: "superman")

guardJobWithOptionalChaining(owner: yagom); // [옵셔널 체이닝] 우리집 경비원 직업은 직업이 없어요

yagom?.home                 = apart
yagom?.home?.aptGuard       = superman
yagom?.home?.aptGuard?.job  = "경비원"

guardJobWithOptionalChaining(owner: yagom); // [옵셔널 체이닝] 우리집 경비원 직업은 경비원입니다.

// nil 병합 연산자
// ($0 ?? $1) => 첫번째 인자 값이 nil일 경우 두번째 인자 값을 return한다.

var guardJob: String

guardJob = yagom?.home?.aptGuard?.job ?? "슈퍼맨"
print("[nil 병합 연산자] \(guardJob)")   // [nil 병합 연산자] 경비원

yagom?.home?.aptGuard?.job = nil
guardJob = yagom?.home?.aptGuard?.job ?? "슈퍼맨"
print("[nil 병합 연산자] \(guardJob)")   // [nil 병합 연산자] 슈퍼맨

///////////////////////////////////////////////////////////////////////////////////////////////
// 빠른 종료(guard)
// - if문의 반대
// - 예외 사항만 처리하고 싶을 때 간편하게 사용
///////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////
// 고차함수(High-order Function) : 매개변수로 함수를 갖는 함수
// 맵
// - 매개변수로 전달된 함수를 실행하여 결과를 반환해주는 함수
// - 새로운 컨테이너가 생성되어 반환됨.
// - for-in 구문과 성능 차이가 있음.
// 모나드  : 디자인 패턴
// 컨텍스트 : 콘텐츠를 담은 무언가
// 플랫맵  : 컨텍스트의 콘텐츠를 계산하고 다시 컨텍스트로 쌓는다.
///////////////////////////////////////////////////////////////////////////////////////////////
let numbers: [Int] = [0,1,2,3,4]
var doubledNumbers: [Int]
var strings: [String]

// 초기화
doubledNumbers  = [Int]()
strings         = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print("[맵] for문을 사용하여 값 2배로 : \(doubledNumbers)")   // [맵] for문을 사용하여 값 2배로 : [0, 2, 4, 6, 8]
print("[맵] for문을 사용하여 숫자를 문자열로 : \(strings)")     // [맵] for문을 사용하여 숫자를 문자열로 : ["0", "1", "2", "3", "4"]

doubledNumbers  = numbers.map({ (number: Int) -> Int in return number * 2})
strings         = numbers.map({ (number: Int) -> String in return "\(number)"})
print("[맵] map을 사용하여 값 2배로 : \(doubledNumbers)")    // [맵] map을 사용하여 값 2배로 : [0, 2, 4, 6, 8]
print("[맵] map을 사용하여 숫자를 문자열로 : \(strings)")       // [맵] map을 사용하여 숫자를 문자열로 : ["0", "1", "2", "3", "4"]

// 플랫맵
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4,5,Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 }}
let flatmappedMultipleContainer = multipleContainer.compactMap{ $0.compactMap{ $0 }}

print("[플랫맵] \(mappedMultipleContainer)")       // [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print("[플랫맵] \(flatmappedMultipleContainer)")   // [1, 2, 3, 4, 5]

///////////////////////////////////////////////////////////////////////////////////////////////
// 필터
// - 컨테이너 내부의 값을 걸러서 추출하는 역할
// - true인 경우에 대해서만 새 컨테이너에 추가함.
///////////////////////////////////////////////////////////////////////////////////////////////

let numbers_f: [Int] = [0,1,2,3,4,5]

let evenNumbers_f: [Int] = numbers_f.filter({(number: Int) -> Bool in return number % 2 == 0})
print("[필터] 짝수 : \(evenNumbers_f)")     // [필터] 짝수 : [0, 2, 4]

let oddNumbers_f: [Int] = numbers_f.filter({(number: Int) -> Bool in return number % 2 != 0})
print("[필터] 홀수 : \(oddNumbers_f)")      // [필터] 홀수 : [1, 3, 5]

///////////////////////////////////////////////////////////////////////////////////////////////
// 리듀스
// - 컨테이너 내부의 콘텐츠를 하나로 합하는 함수
// - 초깃값을 정함.
// - 값을 return 받거나, 함수 안,밖에서 사용할 수 있는 inout 매개변수를 사용하여 직접 연산할 수 있음.
///////////////////////////////////////////////////////////////////////////////////////////////

let numbers_r: [Int] = [1,2,3]

let sumFromThree: Int = numbers_r.reduce(3) {
    print("[리듀스] \($0) + \($1)")
    // [리듀스] 3 + 1
    // [리듀스] 4 + 2
    // [리듀스] 6 + 3
    return $0 + $1
}

print("[리듀스] 결과 = \(sumFromThree)")    // [리듀스] 결과 = 9

let numbers_r2: [Int] = [1,2,3]

let sumFromInOut = numbers_r2.reduce(into:1, {(result: inout Int, element: Int) in
    print("[리듀스2] \(result) + \(element)")
    // [리듀스2] 1 + 1
    // [리듀스2] 2 + 2
    // [리듀스2] 4 + 3
    result  += element
})

print("[리듀스2] 결과 = \(sumFromInOut)")

let numbers_r3: [Int] = [1,2,3,4]

var doubledNumbers_r3: [Int] = numbers_r3.reduce(into: [1, 2]) {
    (result: inout [Int], element: Int) in
    print("[리듀스3] Before) result: \(result) element: \(element)")
    guard element % 2 == 0 else {
        return
    }
    
    result.append(element * 2)
    print("[리듀스3] After) \(result) append \(element)")
}




