//
//  StudyGuardOptional.swift
//  Study
//
//  Created by Dahye on 2021/03/07.
//

import Foundation
import UIKit

func guardValidate(id: String?) -> Bool {
    // guard - else 생략 불가, 실행종료 구문을 넣어야 함, if문은 중첩이 생길 수 있지만 guard는 짧게 가능
    // Early Exit(일찍 종료, 불필요한 코드는 실행하지 않음)
    // 대부분 로컬 스코프에서 사용함
    guard let id = id else {
        return false
    }
    
    guard id.count >= 6 else {
        return false
    }
    
//    guard let id2 = id, id2.count >= 6 else {
//        return false
//    }
    return true
}

func guardOrIf() {
    // 어떻게 사용하면 좋을까? - 조건이 하나거나, 단순하면 if, 상수를 임시값으로 사용 -> if
    // 바인딩 구문이 복잡하거나, 상수를 동일 스코프에서 계속 사용해야 한다면 guard
    func validateUsingIf() {
        let id: String? = nil
        
        // 옵셔널 바인딩, str은 if 내부에서만 사용가능
        if let str = id {
            if str.count >= 6 {
                print(str)
            }
        }
    }
    
    func validateUsingGuard() {
        // 반드시 코드를 종료해야 한다. scope를 탈출해야 한다
        let id: String? = nil
        
        // else에서는 str을 사용할 수 없으나 구문 이후 사용 가능함.
        // code 중첩이 발생하지 않음
        guard let str = id else { return }
        guard str.count >= 6 else { return }
        
        print(str)
    }
}

func ValueBinding() {
    let a = 1

    switch a {
    case var x where x > 100: // 변수 바인딩 가능
        x = 200
        print(x) // 100보다 큰 값
    default:
        break
    }
    
    let pt = (1, 2)
    
    switch pt {
    case let(x, y):
        print(x, y)
    case (let x, var y):
        y == 200
        print(x, y)
    case (let x, _):
        print(x)
        
    }
}

func ExpressionPattern() {
    let a = 1
    switch a {
    case 0...10:
        print ("0~10")
    default:
        break
    }
    
    // pattern Matching Operator a ~= b
    struct Size: Equatable {
        var width = 0.0
        var height = 0.0
        
        static func ~=(left: Range<Int>, right: Size) -> Bool {
            return left.contains(Int(right.width))
        }
    }
    
    let s = Size(width: 10, height: 20)
    
    switch s {
//    case 1..<9:
//        print("1~9")
//    case 10..<99:
//        print("10~99")
    default:
        break
    }
}

func optionals() {
    let num: Int
    let optionalNum: Int? = nil // 아무것도 저장하지 않겠다. 값이 없다. 추론할 수 있는 형식이 없다. 옵셔널에 기본값 지정시에는 반드시 타입 지정
    
    let str: String = "Swift"
    let optinalStr: String? = nil
    
    let a: Int? = nil
    let b = a // 결과가 옵셔널이면 옵셔널 표현식이라고 부른다
    
    func Unwrapping() {
        var num: Int? = nil
        print(num) // Optional(123)
        
        num = 123
        print(num) // 123
        
        // ForcedUnwrapping
        print(num!)
        num = nil
        print(num!) // 런타임 에러
        
        if num != nil {
            print(num!)
        } // 좀 안전함. 하지만 최대한 사용하지 않는 것이 좋다.
    }
}

func optionalBinding() {
    let num: Int? = nil
    // binding을 진행하면 unwraping이 되어 상수나 변수에 저장된다
    // 옵셔널 바인딩을 사용해서 unwraping을 해야한다
    
    if num != nil {
        print(num!)
    } else {
        print("empty")
    }
    
    if let num = num {
        // 같은 이름을 사용해도 된다. 로컬 scope에서 실행한다.
        print(num)
    } else {
        print("empty")
    }
    
    let str: String? = "str"
//    guard let str = str else {
//        fatalError()
//    } swift5
    print(str)
    
    let a: Int? = 12
    let b: String? = "str"
    
    if let num = a, let str = b, str.count > 5{
        print(a)
        print(b)
    }
}

func ImplicitlyUnwrappedOptionals() {
    // IUO - 특정 조건에서 자동으로 추출되는 옵셔널
    // 1. Outlet 연결, 2.API에서 IUO를 리턴하는 경우 발생
    // 옵셔널 바인딩이나 옵셔널 바인딩으로 진행.
    // Type!
    
    let num: Int! = 12 // nil이 되면 b는 에러가 발생함.
    let a = num
    a // Int?
    
    let b: Int = num
    b // Int - IUO는 non Optional Type으로 처리되어야 할 때 자동으로 Unwapping 된다.
}

func nilCoalescingOperator() {
    // syntax - example
    // a ?? b - OptionalExpression ?? Expression
    var msg = ""
    var input: String? = "Swift"
    
    if let inputName = input {
        msg = "Hello, " + inputName
    } else {
        msg = "Hello, Stranger"
    }
    
    var str = "Hello, " + (input != nil ? input! : "Stranger")
    // nilCoalescingOperator
    // 왼쪽 옵셔널 표현식 평가 후 오른쪽 표현식을 평가
    // 단락평가 수행, Early Exit
    str = "Hello, " + (input ?? "Stranger")
}

func optionalChaining1() {
    struct Contacts {
        var email: [String: String]
        var address: String
    }
    
    struct Person {
        var name: String
        var contacts: Contacts
        
        init(name: String, email: String) {
            self.name = name
            contacts = Contacts(email: ["home": email], address: "Seoul")
        }
    }
    
    var p = Person(name: "James", email: "swift@example.com")
    let a = p.contacts.address // non optional chaining
    a // "Seoul, String
    
    var optionalP: Person? = Person(name: "James", email: "swift@example.com")
    let b = optionalP?.contacts.address // optionalP에 ?를 추가해야함 => optional Chaining
    b // "Seoul", String? -> 항상 마지막 표현식의 자료형으로 리턴이 됨
    // 전체 표현식 중 하나라도 optional이 있는경우 무조건 Optional로 리턴
    
    optionalP = nil
    let c = optionalP?.contacts.address
    c // nil, String?
}

func optionalChaining2() {
    // contacts 속성 Optional 변경
    struct Contacts {
        var email: [String: String]
        var address: String
    }
    
    struct Person {
        var name: String
        var contacts: Contacts?
        
        init(name: String, email: String) {
            self.name = name
            contacts = Contacts(email: ["home": email], address: "Seoul")
        }
    }
    
    var p = Person(name: "James", email: "swift@example.com")
    let a = p.contacts?.address
    a // "Seoul", String?
    
    var optionalP: Person? = Person(name: "James", email: "swift@example.com")
    let b = optionalP?.contacts?.address
    b // "Seoul", String?
    
    optionalP = nil
    let c = optionalP?.contacts?.address
    c // nil, String?
    
    
}

func optionalChaining3() {
    // address 속성 Optional 변경
    // Person에 getContacts() 추가
    // Contacts에 printAddress() 추가
    struct Contacts {
        var email: [String: String]
        var address: String?
        
        func printAddress() {
            print(address ?? "no address")
        }
    }
    
    struct Person {
        var name: String
        var contacts: Contacts?
        
        init(name: String, email: String) {
            self.name = name
            contacts = Contacts(email: ["home": email], address: "Seoul")
        }
        
        func getContacts() -> Contacts? {
            return contacts
        }
    }
    
    var p = Person(name: "James", email: "swift@example.com")
    let a = p.contacts?.address // 옵셔널이 마지막이라면 체인을 걸지 않아도 됨.
    a // "Seoul", String?
    
    p.contacts?.address?.count
    
//    p.getContacts().address
    p.getContacts()?.address // 메소드가 옵셔널 타입을 리턴하고, 이 타입을 통해 멤버 접근시 괄호 뒤에 붙인다
    
    let f: (() -> Contacts?)? = p.getContacts
//    f()?.address -> 함수 자체가 옵셔널이므로 괄호 뒤에만 붙이는 것으로 부족함
    f?()?.address
    
    let d = p.getContacts()?.printAddress() // 옵셔널 체이닝이지만 마지막 메소드가 값을 리턴하지 않을 때
    d // ()? Optional Void -> 값을 리턴하지 않는다는 특별한 키워드
    
    // 실제로 메소드가 호출되었는지 확인할 수 있다
    if p.getContacts()?.printAddress() != nil {
        // 실행됨
    }
    
    if let _ = p.getContacts()?.printAddress() {
        // 좀 더 세련된 코드
    }
    
    let e = p.contacts?.email["home"]
}

func optionalChaining4() {
    // subScripts
    // email Optional로 변경
    struct Contacts {
        var email: [String: String]?
        var address: String?
        
        func printAddress() {
            print(address ?? "no address")
        }
    }
    
    struct Person {
        var name: String
        var contacts: Contacts?
        
        init(name: String, email: String) {
            self.name = name
            contacts = Contacts(email: ["home": email], address: "Seoul")
        }
        
        func getContacts() -> Contacts? {
            return contacts
        }
    }
    
    var p = Person(name: "James", email: "swift@example.com")
    var optionalP: Person? = Person(name: "James", email: "swift@example.com")
    optionalP = nil
    
//    let e = p.contacts?.email["home"]
    let e = p.contacts?.email?["home"] // 값에따라 결정됨. String?
    // Dictionary에서 키를 통해 값을 추출하고자 할 때, Dictionary가 Optional이라면 [] 앞에
    
    p.contacts?.email?["home"]?.count
    // subScripts가 리턴하는 값을 통해 속성에 접근하거나 메소드를 호출할 땐 [] 뒤에
    
    p.contacts?.address = "Daegu" // 새로운 값 저장됨
    optionalP?.contacts?.address  = "Daegu" // nil
    // 첫번째 표현식이 nil이므로 contacts에 접근하지 않음
    // 최종속성에 접근하면 값을 저장한다.
}

func optionalPattern() {
    // public enum Optional<Wrapped>
    // case none, some(Wrapped)
    
    let a: Int? = 0
    let b: Optional<Int> = 0
    
    if a == nil { }
    if a == .none { }
    
    if a == 0 { }
    if a == .some(0) { }
    
    if let x = a { print(x) }
    if case .some(let x) = a { print(x) }
    if case let x? = a { print(x) } // optionalPattern, Int(바인딩 시점에 Unwarpping
    // 옵셔널 바인딩과 결과는 동일하지만, 코드가 좀 더 단순해지는 장점이 있다.
    
    let list: [Int?] = [0, nil, nil, 3, nil, 5]
    
    for item in list { // 옵셔널 바인딩, 반복코드 6번 반복, print는 3번
        guard let x = item else { continue }
        print(x)
    }
    
    for case let x? in list { // 옵셔널 패턴, 반복코드 3번 실행
        print(x)
    }
}
