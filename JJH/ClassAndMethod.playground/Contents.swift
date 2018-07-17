//: Playground - noun: a place where people can play

import UIKit

class Rectangle{
    var width:Int
    var height:Int
    init() {
        width = 100
        height = 100
    }
    
    var isSquare:Bool{
        get{
            return width == height
        }
    }
}


var nemo = Rectangle()
nemo = Rectangle()
nemo.width = 200

let nemo2 = Rectangle()
//nemo2 = Rectangle()
nemo2.width = 300


class Shape{
    var r:Rect
    var t:Triangle
    class Rect{
        var w = 100
        var h = 200
    }
    class Triangle{
        var w = 100
        var a = 60
    }
    init(r:Rect, t:Triangle) {
        self.r = r
        self.t = t
    }
}

let shape = Shape(r:Shape.Rect(), t:Shape.Triangle())
print(shape.r.w)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Student{
    static let university = "한국대학교"
    var name = "John"
    var age:Int?
    
    let thisYear = 2018
    var birthYear:Int = 0
    var birthAge:Int{
        get{
            return thisYear - birthYear
        }
        set(newValue){
            //newValue는 생략가능 또는 변수명을 변경가능
            birthYear = thisYear - newValue
        }
    }
    
    func sayHello(){
        print("Hello : \(name)")
    }
    
    static func sayGoodbye(){
//        print("Bye~ : \(name)")
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Dollar{
    var money = 1128{
        willSet{
            print("달러환율이 \(money)에서 \(newValue)로 변경될 예정")
        }
        didSet{
            print("달러 환율이 \(oldValue)에서 \(money)로 변경 완료")
        }
    }
}

var dollar = Dollar()
dollar.money = 1150


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Person{
    var name = "Horn"
    var phone = Phone()
}
class LazyPerson{
    var name = "Lazy Horn"
    lazy var phone = Phone()
}
class Phone{
    var number:String
    init(){
        print("make Phone")
        number = "010-1234-1234"
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//기타 언어와 다르게 클래스로만 구성이 아닌 구조체도 클래스의 충분한 대안이 될 수 있다.
struct Point{
    var x = 0
    var y = 0
}

var p1 = Point()
p1.x = 10
p1.y = 20
print(p1)

var p2 = Point(x:3, y:5)
print(p2)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct PointNonInit{
    var x:Int
    var y:Int
}

//var pn1 = PointNonInit()
//print(pn1)

var pn2 = PointNonInit(x:5, y:10)
print(pn2)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


struct PointInit{
    var x:Int
    var y:Int
    init() {
        self.x = 15
        self.y = 30
    }
}

var obj = Point()
print(obj)

//var obj2= Point(x:1 ,y:2)
//print(obj2)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct MyStruct{
    var value:Int
    
    init(v:Int) {
        self.value = v
    }
    
    init(){
        self.init(v:0)
    }
}

var myobj = MyStruct()
print(myobj)

var myobj2 = MyStruct(v : 5)
print(myobj2)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct PointMove{
    var x = 0
    var y = 0
//    func moveTo(x:Int, y:Int) {
//        self.x = x
//        self.y = y
//    }
    mutating func moveTo(){
        x+=1
        y+=1
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


struct MyStructStatic{
    static func staticFunc(){
        print("Static Method")
    }
    
    static var staticProperty:Int!
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class MyClass{
    var my:Int = 10
}

struct MyStructure{
    var my:Int = 10
}

let objClass = MyClass()
let objClass2 = objClass

print(objClass.my)
print(objClass2.my)
objClass.my = 110
print(objClass2.my)

let struct1 = MyStructure()
let struct2 = struct1

var struct3 = MyStructure()
var struct4 = struct3

print(struct1.my)
print(struct2.my)
//struct1.my = 110
print(struct2.my)

print(struct3.my)
print(struct4.my)
struct3.my = 110
print(struct4.my)



/* class or structure
 * POP (Protocol Oriented Programing)
 */

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


enum Day : Int{
    case am, pm
}
Day.am
Day.pm
let enum1 = Day.am
enum1.rawValue
let enum2 = Day(rawValue: 1)

