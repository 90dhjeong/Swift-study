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

func stringIndices() {
    // 반드시 올바른 index를 사용해야 한다(runtime error 발생)
    
    let str = "Swift"
    
    let firstCh = str[str.startIndex] // S
    let lastCh = str[str.endIndex] // error - past the end
    
    let lastCharIndex = str.index(before: str.endIndex)
    let lastCh2 = str[lastCharIndex]
    
    let secondCharIndex = str.index(after: str.startIndex)
    let secondCh = str[secondCharIndex] // w
    
//    var thirdCharIndex = str.index(a fter:secondCharIndex)
    var thirdCharIndex = str.index(str.startIndex, offsetBy: 2)
    var thirdCh = str[thirdCharIndex] // i
    
    thirdCharIndex = str.index(str.endIndex, offsetBy: -3)
    thirdCh = str[thirdCharIndex]
    
    if thirdCharIndex < str.endIndex && thirdCharIndex >= str.startIndex {
        
    }
}

func rangeOperator() {
    // 1 ~ 5
    
    // Closed Range Operator
    // 이항 a ... b
    // 단항 a... / ...a
    // upperBound가 범위에 포함된다
    
    var sum = 0
    for num in 1 ... 10 {
        sum += num
    } // 55
    
    let list = ["A", "B", "C", "D", "E"]
    list[2...]
    list[...2] // 범위 고정시 사용 가능
    
    // Half-Open Range Operator
    // 이항 a ..< b
    // 단항 ..<a
    // upperBound가 범위에 포함되지 않는다
    
    sum = 0
    for num in 1 ..< 10 {
        sum += num
    } // 45
    
    list[..<2]
    
    let range = 0 ... 5
    range.contains(7)
    range.contains(1)
    
    let range2 = ...5
    range2.contains(7)
    range2.contains(1)
    range2.contains(-1) // true ->  lowerBound가 무한대가 됨
}

func stringBasic() {
    // 문자열은 시퀀스라 for 가능
    var str = "Hello, Swift String"
    var emptyStr = ""
    emptyStr = String()
    
    let a = String(true) // "true"
    let b = String(12) // "12"
    let c = String(12.34)
    let d = String(str)
    
    let hex = String(123, radix: 16) // "7b"
    let octal = String(123, radix: 8) // 173
    let binary = String(123, radix: 2) // 1111011
    
//    let repeatStr = "✌️"
    let repeatStr = String(repeating: "✌️", count: 10) // ✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️
    
    let e = "\(a) \(b)"
    let f = a + " " + b
    str += "!!" // Hello, Swift String!!
    str.count // 21
    str.count == 0
    str.isEmpty // false
    
    str == "Apple" // false
    "apple" != "Apple" // true
    "apple" < "Apple" // false (아스키 코드 크기 비교)
    
    str.lowercased() // 소문자 변환(ed는 새로운 값을 리턴, 원본은 건드리지 않음)
    str.uppercased() // 대문자 변환
    
    str.capitalized // UpperCamelCase 변환
    
    for char in "Hello" {
        print(char)
    }
    
    let num = "1234567890"
    num.randomElement() // 랜덤한 문자 하나 추출
    
    num.shuffled() // 문자열을 셔플한 뒤 배열로 반환
}

func subString() {
    // 하나의 문자열에서 특정 범위의 문자열
    // 읽을 땐 원본 문자열의 메모리를 공유한다
    // 변경할 땐 새로운 문자열을 생성한다(컴파일러 자동처리)
    // 메모리 절약을 위해 사용
    let str = "Hello, Swift"
    let l = str.lowercased() // 별도의 메모리로 저장됨
    
    var first = str.prefix(1) // 원본 메모리를 공유함
    // first는 String.SubSequence (SubString의 typealias)
    first.insert("!", at: first.endIndex) // 별도의 메모리로 저장됨
    
    print(str) // "Hello, Swift"
    print(first) // "Hi!" // Copy-on-write Optimization
    
    let newStr = String(str.prefix(1)) // 별도의 메모리 공간에 저장됨
    let s = str[str.startIndex ..< str.index(str.startIndex, offsetBy: 2)] // He
    let s2 = str[..<str.index(str.startIndex, offsetBy: 2)]
    let s3 = str[str.index(str.startIndex, offsetBy: 2)...]
    
    let lower = str.index(str.startIndex, offsetBy: 2)
    let upper = str.index(str.startIndex, offsetBy: 5)
    let s4 = str[lower ... upper]
    // s는 subString
}

func stringEditing1() {
    // 문자열 추가, 사이에 넣기
    var str = "Hello"
    str.append(", ")
    
    let s = str.appending("Swift")
    print(str) // append - 대상 문자열을 직접 변경
    print(s) // appending - 원본을 변경하지 않고 새로운 값을 리턴함
    
    "File size is ".appendingFormat("%.1f", 12.3456) // 새로운 문자열 리턴
    
    var str2 = "Hello Swift"
    str2.insert(",", at: str.index(str.startIndex, offsetBy: 5))
    
    if let sIndex = str2.firstIndex(of: "S") {
        str2.insert(contentsOf: "Awesome", at: sIndex)
    }
}
   
func stringEditing2() {
    // 교체, 삭제
    // 문자열 비교는 기본적으로 대소문자를 구별한다
    var str = "Hello, Obejctive-C"
    if let range = str.range(of: "Objective-C") {
        str.replaceSubrange(range, with: "Swift")
    }
    
    if let range = str.range(of: "Hello") {
        let s = str.replacingCharacters(in: range, with: "Hi")
    } // 원본변경 X
   
    var s = str.replacingOccurrences(of: "Swift", with: "Awesome Swift")
    // 새로운 문자열 리턴
    s = str.replacingOccurrences(of: "swift", with: "Awesome Swift")
    // 대소문자를 구분하므로 원본문자열을 리턴함
    
    s = str.replacingOccurrences(of: "swift", with: "Awesome Swift", options: .caseInsensitive)
    // 대소문자 구분 없이 진행
    
    //Removing SubString
    var str2 = "Hello, Awesom Swift!!!"
    let lastCharIndex = str2.index(before: str.endIndex)
    var removed = str2.remove(at: lastCharIndex) // 원본 삭제, Character를 리턴함, 잘못된 인덱스는 에러 발생
    
    removed = str2.removeFirst() // 삭제된 문자를 리턴함, 원본 삭제
    str2.removeFirst(2) // 2개의 문자를 삭제함, 리턴해주진 않음
    
    str2.removeLast()
    str2.removeLast(2)
    
    if let range = str.range(of: "Awesome") {
        str2.removeSubrange(range) // 범위 삭제시 사용
    }
    
    str.removeAll() // 메모리공간도 함께 삭제함
    str2.removeAll(keepingCapacity: true) // 메모리 공간은 유지함
    
    str2 = "Hello, Awesom Swift!!!"
    var substr = str.dropLast() // 원본 문자열과 메모리를 공유함, 마지막!을 삭제한 뒤 새로운 문자열을 리턴함
    substr = str2.dropLast(3) // 3개를 제외한 나머지 문자열과 메모리를 공유함
    
    substr.drop(while: { (ch) -> Bool in
        return ch != ","
    }) // true가 리턴되는 동안 삭제, false리턴 시 종료하고 남은 문자열을 리턴함
    print(substr) // ",Awusome Swift!!!"
}

func stringComparison() {
    // 문자열 비교
    let largeA = "Apple"
    let smallA = "apple"
    let b  = "Banana"
    
    largeA == smallA // false
    largeA != smallA // true
    
    // 문자열에 할당된 코드의 크기 비교
    largeA < smallA // true, ascii code
    largeA < b // true
    smallA < b // false
    
    // 메소드로 비교
    largeA.compare(smallA) // NSComparisonResult가 반환
    largeA.compare(smallA) == .orderedSame // 같은지 비교할 때(대소문자 구분) - false
   
    largeA.caseInsensitiveCompare(smallA) == .orderedSame // 같은지 비교할 때(대소문자 구분 없이) - true
    largeA.compare(smallA, options: [.caseInsensitive]) == .orderedSame // 위와 같음. 문자열 옵션을 지정할 때 사용

    let str = "Hello, Swift Programming!"
    let prefix = "Hello"
    let suffix = "Programming"
    
    str.hasPrefix(prefix) // true
    str.hasSuffix(suffix) // false
    
    str.lowercased().hasPrefix(prefix.lowercased()) // 대소문자 구별 없이 접두어 비교
}

func stringSearching() {
    // 단어 검색
    let str = "Hello, Swift"
    str.contains("Swift") // 포함여부를 Bool로 반환
    str.contains("swift") // false
    str.lowercased().contains("swift") // true
    
    // 범위 검색
    if let range = str.range(of: "Swift") {
        
    }
    str.range(of: "swift", options: [.caseInsensitive])
    
    let str2 = "Hello, Programming"
    let str3 = str2.lowercased() // 별도의 메모리, subString이 아님.
    
    var common = str.commonPrefix(with: str2) // 공통 접두어만 새로운 문자열로 리턴
    common = str.commonPrefix(with: str3)
    common = str.commonPrefix(with: str3, options: .caseInsensitive)
}

func stringOptions1() {
    // 9가지의 문자열 옵션 제공
    
    //Case Insensitive Option
    "A" == "a" // false
    "A".caseInsensitiveCompare("a") == .orderedSame
    "A".compare("a", options: .caseInsensitive) == .orderedSame
    
    //Literal Option
    let a = "\u{D55C}" // 완성형 한
    let b = "\u{1112}\u{1161}\u{11AB}" // 조합형 한
    
    a == b //  true
    a.compare(b) == .orderedSame // true, 유닛을 합친 후 최종 문자가 같기 때문
    a.compare(b, options: [.literal]) == .orderedSame // 이 옵션을 사용하는게 빠름, 코드유닛을 비교함
    
    //Backward Option - 문자 읽는 방향 leading -> Trailng
    let korean = "행복하세요"
    let english = "Be happy"
    let arabic = "어랍아"
    
    if let range = english.range(of: "p") {
        english.distance(from: english.startIndex, to: range.lowerBound) // 5
    }
    
    if let range = english.range(of: "p", options: .backwards) {
        english.distance(from: english.startIndex, to: range.lowerBound) // 6 (y앞의 p)
    }
    
    //Anchored Option - 검색 범위 지정
    let str = "Swift Programming"
    if let result = str.range(of: "Swift") {
        print(str.distance(from: str.startIndex, to: result.lowerBound))
    } else {
        print("not found")
    } // 0
    
    if let result = str.range(of: "Swift", options: .backwards) {
        print(str.distance(from: str.startIndex, to: result.lowerBound))
    } else {
        print("not found")
    } // 0
    
    if let result = str.range(of: "Swift", options: .anchored) {
        print(str.distance(from: str.startIndex, to: result.lowerBound))
    } else {
        print("not found")
    } // 0
    
    if let result = str.range(of: "Swift", options: [.anchored, .backwards]) {
        print(str.distance(from: str.startIndex, to: result.lowerBound))
    } else {
        print("not found")
    } // not found - 진행방향에서 안 보였기 때문
    
    str.hasPrefix("swift")
    str.lowercased().hasPrefix("swift")
    if let _ = str.range(of: "swift", options: [.anchored, .caseInsensitive]) {
        print("same prefix")
    } // same prefix
    
    str.hasSuffix("swift")
    if let _ = str.range(of: "swift", options: [.anchored, .backwards,.caseInsensitive]) {
        print("same prefix")
    } // same prefix
    
}

func stringOptions2() {
    //Numeric Option - 문자에 포함된 숫자를 숫자 자체로 처리함
    "A" < "B" // true
    "a" < "B" // false - 문자에 할당되어있는 코드(아스키)의 크기 비교
    
    let file9 = "file9.txt"
    let file10 = "file10.txt"
    
    file9 < file10 // false
    file9.compare(file10) == .orderedAscending // false
    file9.compare(file10, options: .numeric) // ture
    
    // Diacritic Insensitive Option - 발음기호 무시
    let a = "Cafe"
    let b = "Cafè"
    
    a == b // false
    a.compare(b) == .orderedSame // 실제 모양이 다르므로 false
    a.compare(b, options: .diacriticInsensitive) == .orderedSame // ture
    
    // Width insensitive Option - 전각, 반각문자 무시
    let x = "\u{30A1}"
    let y = "\u{ff67}"
    
    x == y // false
    x.compare(y) == .orderedSame // false
    a.compare(b, options: .widthInsensitive) == .orderedSame // true
    
    // Forced Ordering Option - 전체 옵션 적용시 같은 문자열이라면 순서를 판단하기 위해 일부 옵션을 무시하고 정렬함
    let upper = "STRING"
    let lower = "string"
    
    upper == lower
    upper.compare(lower, options: [.caseInsensitive]) == .orderedSame // true
    upper.compare(lower, options: [.caseInsensitive, .forcedOrdering]) == .orderedSame // false
    

    // Regular Expression Option - 정규식 옵션
    let emailPattern = "([0-9a-zA-z_-]+)@([0-9a-zA-z_-]+){\\.[0-9a-zA-z_-]+)(1,2}"
    let emailAddress = "user@example.com"
    
    if let _ = emailAddress.range(of: emailPattern) {
        print("found")
    } else {
        print("not found")
    } // 바인딩 실패, 문자열 자체 비교
    
    if let _ = emailAddress.range(of: emailPattern, options: .regularExpression) {
        print("found")
    } else {
        print("not found")
    } // found, 올바른 범위를 리턴하지만 올바른 이메일이라고 할 수는 없음
    // 패턴이 존재한다면 그냥 리턴함. 이 경우 다시 한 번 확인
    
    if let range = emailAddress.range(of: emailPattern, options: .regularExpression), (range.lowerBound, range.upperBound) == (emailAddress.startIndex, emailAddress.endIndex) {
        print("found")
    } else {
        print("not found")
    } // 범위가 일치하는지 튜플로 저장한 후 크기를 비교함
}

func characterSet() {
    // 문자 집합. 문자열 검색이나 잘못된 문자 삭제시 사용
    // CharacterSet -> 구조체로 선언되어 있음
    
    let a = CharacterSet.uppercaseLetters // 대문자만 포함
    let b = a.inverted // 나머지 모든 문자가 포함됨
    
    var str = "loRem Ipsum"
    var charSet = CharacterSet.uppercaseLetters
    
    if let range = str.rangeOfCharacter(from: charSet) {
        print(str.distance(from: str.startIndex, to:range.lowerBound ))
    } // 2
    
    if let range = str.rangeOfCharacter(from: charSet, options: .backwards) {
        print(str.distance(from: str.startIndex, to:range.lowerBound ))
    } // 6
    
    str = " A p p l e "
    charSet = .whitespaces
    
    let trimmed = str.trimmingCharacters(in: charSet)
    print(trimmed) // 시작과 끝의 공백 제거
    
    var editTarget = CharacterSet.uppercaseLetters
    editTarget.insert("#") // 문자 추가
    editTarget.insert(charactersIn: "~!@") // 3개 추가
    editTarget.remove("A")
    editTarget.remove(charactersIn: "BCD")
    
    // custom
    let customCharSet = CharacterSet(charactersIn: "@.")
    let email = "userId@example.com"
    
    let components = email.components(separatedBy: customCharSet) // 문자열 분리 후 리턴
    // userID, example, com
}
