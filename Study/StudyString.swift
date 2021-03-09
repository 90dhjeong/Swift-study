//
//  StudyString.swift
//  Study
//
//  Created by Dahye on 2021/03/08.
//

import Foundation

func tuples() {
    // Scalar Type - 12
    // Compund Type - (12, 34)
    // 튜플에 저장되는 멤버의 수는 생성될 때 고정
    // 멤버의 값 변경은 가능함
    // 값형식
    
    let data = ("<html>", 200, "OK", 12.34) // Unnamed Tuple
    print(data.0) // index 접근
    
//    data.1
    
    var mutableTuple = data
    mutableTuple.1 = 404
    
    
    // Named Tuples //
    let named = (body: "<html>", statusCode: 200, statusMessage: "OK", dataSize: 12.34)
    
    named.1
    named.statusCode
    
    
    // Tuple Decomposition //
    /*
        let(name1, name2, ...) = tupleExpr
        var(name1, name2, ...) = tupleExpr
     */
    
//    let body = data.0
//    let code = data.1
//    let message = data.2
//    let size = data.3
    
    let (body, code, message, size) = data
    // 단일값으로 분해되어서 저장됨
    // wildcard pattern으로 생략 가능
    
    
    // Tuple Matching //
    let resolution = (3840.0, 2160.0)
    if resolution.0 == 3840 && resolution.1 == 2160 {
        print("4K")
    }
    
    switch resolution {
    case (3840, 2160):
        print("4K")
    case (3840...4096, 2160):
        print("4K")
    case (_, 1080):
        print("1080p")
    case let (w, h) where w / h == 16.0 / 9.0:
        print("16:9")
    default:
        break
    }
    
    // 여기에서 함수를 구현해 주세요.
    func convertToTuple(name: String, age: Int, address: String) -> (name: String, age: Int, address: String) {
        return (name, age, address)
    }

    let name = "John doe"
    let age = 34
    let address = "Seoul"

    let t = convertToTuple(name: name, age: age, address: address)

    // 여기에서 튜플에 저장된 이름, 나이, 주소를 순서대로 출력해 주세요.
    print(t.name, t.age, t.address)
}

func stringsAndCharacters() {
    let s = "String"
//    let c = "C"
    let c: Character = "C"
    let emptyChar: Character = " " // 빈문자 저장은 공백 추가
    let emptyString = " "
    emptyString.count // 1
    let emptyString2 = String()
    
    // StringTypes
    // String -> Swift String // 값
    // NSString -> Foundation String // 참조
    var nsstr: NSString = "str"
    let swiftStr: String = nsstr as String // Type Casting
    nsstr = swiftStr as NSString // 유니코드가 달라 주의
    
    let imuutableStr = "str"
    var mutableStr = "str"
    mutableStr = "mutable"
    
    // Unicode - String 레퍼 체크
    let str = "Swift String"
    str.utf8
    str.utf16
    
    var thumbUp = "👍" // unicode Scalar
    thumbUp = "\u{1F44d}"
}

func multilineStringLiterals() {
    // 기존 String은 singleline
    // 명시적 줄바꿈 가능 (엔터)
    // 내용 시작위치는 반드시 새로운 라인에서
    // 마지막 따움표는 한 줄에 단독으로, 첫번째 줄과 동일선상이거나 마지막에 (들여쓰기 기준)
    let interstellar = "Interstellar is a 2014 epic science fiction film directed and produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, John Lithgow, Michael Caine, and Matt Damon. Set in a dystopian future where humanity is struggling to survive, the film follows a group of astronauts who travel through a wormhole near Saturn in search of a new home for mankind."
    
    let multiline = """
    Interstellar is a 2014 epic science fiction film directed and produced by Christopher Nolan. It stars Matthew McConaughey, Anne Hathaway, Jessica Chastain, Bill Irwin, Ellen Burstyn, John Lithgow, Michael Caine, and Matt Damon. Set in a dystopian future where humanity is struggling to survive, the film follows a group of astronauts who travel through a wormhole near Saturn in search of a new home for mankind.
    """
}

func stringInterpolation() {
    /*
        \(expr)
     */
    // 직관적 구성 가능, 포맷 지정이 불가능 (소수점 자릿수 등)
    var str = "12.34KB"
    let size = 12.34
//    str = size + "KB" Double을 문자열로 변경해야 함
    
    str = String(size) + "KB" // 자주 사용하지 않음
    str = "\(size)" + "KB"
    
    // Format Specifier
    /*
     String Format Specifiers
     https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Strings/Articles/formatSpecifiers.html#//apple_ref/doc/uid/TP40004265-SW1
     */
    // %char
    
    str = String(format: "%.1fKB", size) // 12.3KB
    String(format: "Hello, %@", "Swift")
    String(format: "%d", 12)
    String(format: "%d", 12.34) // 0 출력됨
    String(format: "%f", 12.34) // 12.340000 출력됨
    String(format: "%.3f", 12.34) // 12.340 출력됨
    String(format: "%10.3f", 12.34) // [    12.340] 전체문자열을 10자리로, 소수점은 아래는 3자리
    String(format: "%010.3f", 12.34) // [000012.340] 전체문자열을 10자리로, 소수점은 3자리

    String(format: "[%d]", 123) // [123]
    String(format: "[%10d]", 123) // [   123] -> 10자리 출력후 오른쪽 정렬
    String(format: "[%-10d]", 123) // [123    ]] -> 10자리 출력 후 왼쪽 정렬
    
    let firstname = "Dahye"
    let lastName = "Jeong"
    
    let korFormat = "그녀의 이름은 %@ %@ 입니다."
    let korFormat2 = "그녀의 이름은 %2$@ %1$@ 입니다." // 첫번째 포맷지정자는 두번째 파라미터로 교체 ...
    let engFormat = "Her name is %1$@ %2$@"
    
    String(format: korFormat2, firstname, lastName)
    String(format: engFormat, firstname, lastName)
    
    // \ -> \\
    // \t- > tab
    // \n -> newline
    // \" -> "
    // \' -> '
}
