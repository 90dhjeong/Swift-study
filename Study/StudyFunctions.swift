//
//  StudyFunctions.swift
//  Study
//
//  Created by Dahye on 2021/03/07.
//

import Foundation
import UIKit

// Calling Functions
// Defining Functions
// lowerCamelCase
// Actual parameter = argument

func parametersExam() {
    func sayHello(to: String = "Stranger") {
        // to = formal parameter
        print("Hello, \(to)")
    }
    
    sayHello(to: "Swift") // to = actual parameter or argument
    sayHello() // 기본값 지정 시 파라미터 전달하지 않아도 호출 가능
}

func argumentLable() {
    // 함수 이름의 가독성을 높이기 위해 사용
//    func sayHello(name: String) {
//        print("Hello, \(name)")
//    }
//
//    sayHello(name: "Swift")
    // name = Argument Label
    // 파라미터가 1개인 경우, Parameter Name = Argument Lable
    
    func sayHello(to name: String) {
        print("Hello, \(name)")
        // print 함수의 argument Lable은 wildcard pattern
    }
    
    sayHello(to: "Swift")
    // parameter name은 함수 body에서 접근하기 위해 사용, 생략 불가
    // argument Lable은 함수를 호출하면서 Argument를 전달할 때 사용, wildcard 가능
    // 함수이름은 동사, argument name은 전치사, parameter name은 명사
}

func variadicParameters() {
    // (name: Type...)
    // 가변 파라미터는 하나의 파라미터에 두 개 이상의 Argument를 전달할 수 있다
    // Argument는 배열 형태로 전달된다
    // 가변 파라미터는 함수마다 하나씩만 설정할 수 있다(선언 순서는 상관없다)
    // 가변 파라미터는 기본값을 지정할 수 없다
    
    print("Hello")
    print("Hello", "Swift") // argument는 2개, parameter는 1개
    
    func printSum(of nums: Int...) {
        // nums type - [Int]
        var sum = 0
        for num in nums {
            sum += num
        }
        print(sum)
    }
    
    printSum(of: 1, 2, 3) // 콤마로 나열하여 전달
    printSum(of: 1, 2, 3, 4, 5)
}

func inOutParameters() {
    // name: inout Type)
    // functionName(argLabel: &expr)
    // Copy-In Copy-Out Memory Model 복사해서 작업한 뒤 복사를 원본 변수에 붙여넣는다
    
    // 별도의 변수를 하나씩 전달해야 함
    // 상수 전달 불가능 - Copy Out이 안 되기 때문
    // literal 직접 전달 불가 (값을 바꿀 수 없고 leteral은 메모리 공간이 없음)
    // 기본값 선언 불가
    // 가변 파라미터 설정 불가

    var num1 = 12
    var num2 = 34
    
    func swapNumber(_ a: Int, with b: Int) {
//        var tmp = a
//        a = b
//        b = tmp
        // 파라미터는 상수이기 때문에 값을 변경할 수 없음.
    }
    
    swapNumber(num1, with: num2) // num1, num2는 값형식이라 복사본이 전달되므로 변경 불가
    
    func swapNumber2(_ a: inout Int, with b: inout Int) {
        var tmp = a
        a = b
        b = tmp
    }
    swapNumber2(&num1, with: &num2) // inout 파라미터에 전달할 땐 &를 추가해야 한다
}

// First-class Citizen
// - 변수나 상수에 저장할 수 있다
// - 파라미터로 전달할 수 있다
// - 함수에서 리턴할 수 있다

func functionTypes() {
    // () Empty Tuple -> 없다, 파라미터가 없다, 리턴형이 없다.
    // (ParameterTypes) -> ReturnType (Argument Label X)
    
    func sayHello() {
        print("Hello, Swift")
    }
    let f1 = sayHello // () -> ()
    f1()
    
    func printHello(with name: String) {
        print("hello, \(name)")
    }
    let f2: (String) -> () = printHello(with:) // (String) -> ()
    let f3 = printHello(with:) // (String) -> ()
    // 상수에 저장된 함수를 호출할 땐 Argument Label을 쓰지 않는다
    f3("World")
    
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    var f4: (Int, Int) -> (Int) = add(a:b:)
    f4(1, 2)
    
    func add(_ a: Int, with b: Int) -> Int {
        return a + b
    }
    f4 = add(_:with:)
    
    func swapNumbers(_ a: inout Int, _ b: inout Int) {
        
    }
    let f5 = swapNumbers(_:_:)
//    f5(1, 2) // (inout Int, inout Int) -> ()
    
    func sum(of numbers: Int...) {
        
    }
    let f6 = sum(of:)
//    f6 // (int...) -> ()
    
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    func divide(_ a: Int, _ b: Int) -> Int {
        return a / b
    }

//    func selectFunction(by: String) -> ((Int, Int) -> Int)? {
//        // 첫번째는 selectFunction 함수의 리턴타입
            // String을 전달받아 Argument Int 2개를 리턴함
//        // 두번째는 Function Type의 리턴타입
            // 파라미터 2개를 전달받아 Int 1개를 리턴함
//    }
    
    typealias ArithmeticFunction = (Int, Int) -> Int
    
    func selectFunction(from op: String) -> ArithmeticFunction? {
        switch op {
        case "+":
            return add(_:_:)
        case "-":
            return subtract(_:_:)
        case "*":
            return multiply(_:_:)
        case "/":
            return divide(_:_:)
        default:
            return nil
        }
    }
    
    let af = selectFunction(from: "+")
    af?(1, 2)
    selectFunction(from: "*")?(12, 34)
}

func nestedFunctions() {
    func outer() {
        print("outer")
    }
    
    func inner() {
        print("inner")
    }
    
    outer()
    inner()
    
    func outer2() {
        func inner2() {
            print("inner")
        }
        inner2()
        print("outer")
    }

    outer2()
//    inner2()
    
    func outer3() -> () -> () {
        func inner3() {
            print("inner")
        }
        print("outer")
        
        return inner
    }
    
    let f = outer3()
    f()
}

// Named Closures = Function, Nested Function
// Unnamed Closures = Anonymous Function
// 함수와 클로저는 서로 호환된다.

func closures() {
    // obj-c 블록, java 람다
    // { (parameters) -> ReturnType in
    //  statements
    // }
    // { statements }
    // 클로저에선 Argument Label을 사용하지 않는다
    
    let c = { print("Hello, Swift") } // () -> ()
    c()
    
    let c2 = { (str: String) -> String in
        return "Hello, \(str)"
    }
    
    let result = c2("Closure")
    print(result)
    
    typealias SimpleStringClosure = (String) -> String
    
    func perform(closure: SimpleStringClosure) {
        print (closure("iOS"))
    }
    
    perform(closure: c2)
    perform(closure: { (str: String) -> String in
        return "Hi, \(str)"
    }) // inline closure
        
    // API 예제 1
    let products = ["MacBook Air", "MacBook Pro", "iMac", "iMac Pro", "Mac pro", "Mac Mini",
        "iPad Pro", "iPad", "iPad mini", "iPhone XS", "iPhone Xr"]
    
    var proModels = products.filter({ (name: String) -> Bool in
        return name.contains("Pro")
    })
    
    print(proModels)
    print(proModels.sorted()) // 문자 할당 코드 기준으로 진행
    proModels.sort(by: { (lhs: String, rhs: String) -> Bool in
            return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
    }) // 대소문자 관계 없이 정렬
    
    print(proModels)
    
    // API 예제 2
    DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
        print("End")
    })
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        print("End")
    } // Syntax Optimization
}

func syntaxOptimization() {
    // 프레임워크에 구현되어 있는 경우 컴파일러 추론 가능
    
    let products = ["MacBook Air", "MacBook Pro", "iMac", "iMac Pro", "Mac pro", "Mac Mini",
        "iPad Pro", "iPad", "iPad mini", "iPhone XS", "iPhone Xr"]
    
    products.filter({ (name: String) -> Bool in
        return name.contains("Pro")
    })
    var proModels = products.filter({ (name: String) -> Bool in
        return name.contains("Pro")
    })
    
    
    // 1. 파라미터 형식과 리턴형을 생략
    products.filter({ (name) in
        return name.contains("Pro")
    })
    
    // 2. 파라미터 이름은 Shorthand Argument Name으로 대체함
    // 파라미터 이름과 in 키워드 생략
    // ex) &0, $1, $n
    products.filter({
        return $0.contains("Pro")
    })
    
    // 3. 단일 리턴문만 남아있는 경우 return 키워드 생략
    // Implicit Returns
    products.filter({
        $0.contains("Pro")
    })
    
    // 4. 클로저 파라미터가 마지막 파라미터라면 Trailing Closure로 작성
    // Implicit Returns
    products.filter() {
        $0.contains("Pro")
    }
    
    // 5. 괄호 사이에 다른 파라미터가 없으면 괄호를 생랴
    products.filter {
        $0.contains("Pro")
    }
    
    proModels.sort(by: { (lhs, rhs) in
        return lhs.caseInsensitiveCompare(rhs) == .orderedAscending
    })
    
    proModels.sort(by: {
        return $0.caseInsensitiveCompare($1) == .orderedAscending
    })
    
    proModels.sort(by: {
        $0.caseInsensitiveCompare($1) == .orderedAscending
    })
    
    // argument Label이 남아있다면 삭제한다
    proModels.sort() {
        $0.caseInsensitiveCompare($1) == .orderedAscending
    }
    
    proModels.sort {
        $0.caseInsensitiveCompare($1) == .orderedAscending
    }
}

// Named Closures = Function / 값을 캡쳐하지 않음
// Named Closures = Nested Function / 자신을 포함하고 있는 함수 바디에 접근할 때 값을 캡쳐함
// Unnamed Closures = Anonymous Function / 클로저 외부에 있는 값에 접근할 때 참조를 캡쳐함
// 함수와 클로저는 서로 호환된다.

func capturingValues() {
    // 복사본 캡쳐 - Objective-c
    // 참조 캡쳐 - Swift (원본을 직접 가져온다)
    // 클로저에서 메모리 관리를 해주지 않으면 참조사이클 문제가 발생한다.
    
    var num = 0
    let c = {
        num += 1
        print("check point #1 \(num)")
    }
    c() // 클로저는 값을 가져와서 쓴다(캡쳐한다)

    print("check point #2 \(num)") // 원래 변수의 값도 변한다.
}

func excapingCloser() {
    // 함수의 정상적인 흐름으로부터의 탈출
    // 함수의 실행이 종료되면 클로저도 제거되는 문제를 해결할 수 있음
    // 클로저의 실행이 완료될 때 까지 제거하지 않음(변수 포함)
    
    func performNonEscaping(closure: () -> ()) {
        print("start")
        closure()
        print("end")
    }
    
    performNonEscaping {
        print("closure")
    } // start - closure - end
    
    func performEscaping(closure: @escaping () -> ()) {
        print("start")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            closure()
        } // non-escaping parameter error
        
        print("end")
    }

    performEscaping {
        print("closure")
    } // start - end - closure
    
    func performEscaping2(closure: @escaping () -> ()) {
        print("start")
        
        var a = 12
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            closure()
            print(a) // 클로저가 a변수를 캡쳐함
        } // non-escaping parameter error
        
        print("end")
    }
    
    performEscaping2 {
        print("closure")
    } // start - end - closure - 3
}
