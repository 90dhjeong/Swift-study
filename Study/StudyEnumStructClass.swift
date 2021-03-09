//
//  StudyEnumStructClass.swift
//  Study
//
//  Created by Dahye on 2021/03/08.
//

import Foundation
import UIKit

func enumerationTypes() {
    // 연관 상수를 하나로 묶은 자료형, 독립적인 값
    // 상수 - Enumeration Case pr case
    // 코드의 가독성과 안정성이 높아짐
    // 저장된 값 확인 시 주로 Switch문 사용
    
    enum Alignment {
        case left
        case center
        case right
    }

    var testAlignment = Alignment.center
    testAlignment = .left // 변수의 자료형이 열거형인 것을 컴파일러가 알고 있음
    
    if testAlignment == .center {
        
    }
    
    switch testAlignment {
    case .left:
        break
    case .center:
        break
    case .right:
        break
    }
}

func rawValues() {
    // 독립적인 값이지만 또다른 값(원시값)을 가질 수 있다
    // 정수형 원시값이 저장된 열거형이 많음
    // RawValueType -> String, Character, Number Types
    /*
     enum TypeName: RawValueType {
        case caseName = Valuse
     }
     */
    // 원시값의 기본값은 이전값을 기준으로 설정됨
    enum Alignment: Int { // 원시값의 자료형을 Int로 설정, 자동으로 값 할당
        case left
        case center
        case right
    }
    
    Alignment.left.rawValue // 0
    Alignment.center.rawValue // 1
    Alignment.right.rawValue // 2
    
    Alignment(rawValue: 0) // left
    Alignment(rawValue: 200) // nil -> 생성자의 리턴값은 Optional
    
    enum Weekday: String {
        case sunday
        case monday = "MON"
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }
    
    Weekday.sunday.rawValue // "sunday"
    Weekday.monday.rawValue // "MON"
    
    enum ControlChar: Character { // 해당 자료형은 반드시 직접 지정
        case tab = "\t"
        case newLine = "\n"
    }
    
    //test
    enum HttpStatusCode: Int{
        case ok = 200
        case badRequest = 400
        case unauthorized = 401
        case notFound = 404
        case internalServerError = 500
        case badGateway = 502
    }

    func solution(_ statusCode:Int) -> String {
        var returnMsg = String()
        
        if let code = HttpStatusCode(rawValue: statusCode) {
            switch code {
            case .ok:
            returnMsg = "OK"
            case .badRequest:
            returnMsg = "Bad Request"
            case .unauthorized:
            returnMsg = "Unauthorized"
            case .notFound:
            returnMsg = "Not Found"
            case .internalServerError:
            returnMsg = "Internal Server Error"
            case .badGateway:
            returnMsg = "Bad Gateway"
            }
        }
        
        return returnMsg
    }
}

func associatedValues() {
    /*
         enum TypeName {
            case caseName(Type)
            case caseName(Type, Type, ...)
         }
     */
    // 연관된 값을 개별 케이스마다 튜플로 따로 저장한다(형식 제약 없음)
    // 선언 시점이 아니라 열거형 값을 생성할 때 값을 저장함
    // rawValue와 배타적, 값 저장 외엔 동일하지 않음
    // 하나의 열거형에서 rawValue와 함께 사용 불가
    
    enum VideoInterfaceRawValue: String {
        case dvi = "1028x768"
        case hdmi = "2048x1536"
        case displayPort = "3840x2160"
        // 문제 - 문자열에서 숫자를 추출해야함
        // 문제 - 동일한 케이스가 하나의 값을 공유함(해상도를 하나만 사용가능 등)
        // 문제 - 원시값은 하나의 자료형만 사용해야 함
    }
    
    enum VideoInterface {
        case dvi(width: Int, height: Int)
        case hdmi(Int, Int, Double, Bool)
        case displayPort(CGSize, CGSize)
    }
    
    var input = VideoInterface.dvi(width: 2048, height: 1536)
    
    switch input {
    case .dvi(2048, 1536):
        print("dvi 2048 x 1536")
    case .dvi(2048, _):
        print("dvi 2048 x Any")
    case .dvi:
        print("dvi")
    case let .hdmi(hdmi):
        
        print("가능한가?")
    case .hdmi(let width, let height, let version, var audioEnabled):
        print("hdmi \(width)x\(height)")
    case let .displayPort(size): // 모든 연관값을 동일한 형태로 바인딩 - EnumerationCasePattern
        print("dp")
    }
    
    input = .hdmi(3040, 2160, 2.1, true)
}

func enumerationCasePattern() {
    // 연관값을 가진 열거형의 케이스 매칭 시 사용
    /*
        case Enum.case(let name):
        case Enum.case(var name):
     
        case let Enum.case(name):
        case var Enum.case(name):
     */
    
    enum Transportation {
        case bus(number: Int)
        case taxi(company: String, number: String)
        case subway(inlineNumber: Int, express: Bool)
    }
    
    var tpt = Transportation.bus(number: 7)
    
    switch tpt {
    case .bus(let n):
        print(n)
    case .taxi(let c, var n):
        print(c, n)
    case let .subway(l, e):
        // subway 케이스를 매칭시킨 뒤 연관값에 저장된 모든 값을 상수에 바인딩
        // 모든 연관값을 바인딩 한다면, 이 방식이 효율적
        print(l, e)
    }
    
    tpt = Transportation.subway(inlineNumber: 2, express: false)
    
    // let은 바인딩하지 않을거라면 생략
    if case let .subway(2, express) = tpt {
        // subway 케이스에서, inlineNumber가 2라면 실행된다.
        if express {
            
        } else {
            
        }
    }
    
    if case .subway(_, true) = tpt {
        // subway 케이스에서, express가 true라면 실행된다.
        print("express")
    }
    
    let list = [
        Transportation.subway(inlineNumber: 2, express: false),
        Transportation.bus(number: 4412),
        Transportation.subway(inlineNumber: 7, express: false),
        Transportation.taxi(company: "SeoulTaxi", number: "1234")
    ]
    
    for case let .subway(n, _) in list {
        //  패턴과 일치하는 요소만 열거한다
        print("subway \(n)")
    }
    
    for case let .subway(n, true) in list {
        //  패턴과 일치하는 요소만 열거한다
        print("subway \(n)")
    }
    
    for case let .subway(n, true) in list where n == 2 {
        //  where절은 컬렉션 뒤에 작성한다
        print("subway \(n)")
    }
}

/*
 Enumeration, Structure, Class -> Custom Data Type
 Swift는 멀티 패러다임 언어
 - Object-Oriented Prgramming
 - Protocol-Oriented Programming
 - Functional Programming
 
 * Object - 모든 데이터
 * Abstraction - 객체의 데이터 추상화
 * Class - 추상화의 결과를 코드로 구현, 객체를 생성하기 위한 설계도
 * Instance - 클래스를 통해 생성된 객체
 * Structure - 작은 데이터 저장, 객체 대신 값, Instance라고 부름 (Swift는 대부분의 Class 기능을 구현)
 * member - property, method, initializer, subscript
*/

func structuresAndClasses() {
    struct PersonValue  {
        // 구조체는 스택에 값을 저장함
        // 값을 전달할 때 마다 복사본을 생성
        // 값형식 (구조체, 열거형, 기본자료형)
        // 메모리에서 자동으로 제거
        var name: String
        var age: Int
        
        func speak() {
            print("hello")
        }
    }
    
    let p = PersonValue(name: "Steve", age: 50)
    p.name
    p.speak()
    
    class PersonReference {
        // 클래스는 힙에 값을 저장함
        // 스택에는 힙에 저장되어있는 값의 주소를 저장함
        // 값을 전달할 땐 주소를 전달
        // 참조형식(클래스, 함수, 클로저)
        // 상속 지원
        // 참조카운트를 통해 메모리 관리
        var name = "John Doe"
        var age = 0
        
        func speak() {
            print("hello")
        }
    }
    
    // Inirilaizer - 인스턴스 속성 초기화
    class Position {
        var x: Double
        var y: Double
        
        init() {
            x = 0.0
            y = 0.0
        } // 생성자는 모든 속성의 초기화가 된다.
        
        init(value: Double) {
            x = value
            y = value
        }
    }
    
    // value vs reference
    // 함수형과 프로토콜 지향에서는 대부분 구조체로 구현함
    // 상속 구현 또는참조를 전달해야 하는 경우에만 클래스로 구현
}

func identityOperator() {
    /*
     동일성 비교
     값 : Stack에만 저장, 비교연산자로 비교
     참조: heap, Stack 저장, 비교연산자 & 항등연산자로 비교
     
     classInstance === classInstance
     classInstance !== classInstance
     
     Same Memory Address => Identical
     Same Value = Equal
     */
    
    class A {
        
    }
    
    let a = A()
    let b = a
    let c = A()
    
    a === b // true
    a === c // false
}

func nestedType() {
    // String.CompareOptions (Structure.Structure)
    // 가독성이 장점
    // NumberFormmatter / DateFormatter -> style 멤버를 가지고 있음
    // 하나의 Style형식을 구현하고 style을 동시에 사용 가능
    
    class One {
        struct Two {
            enum Three {
                case a
                
                class Four {
                    
                }
            }
        }
        
        var a = Two()
    }
    
    let two: One.Two = One.Two()
    let four: One.Two.Three.Four = One.Two.Three.Four()
    var threeCase: One.Two.Three = One.Two.Three.a
}
