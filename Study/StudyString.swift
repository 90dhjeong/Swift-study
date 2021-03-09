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
