//
//  Maskify.swift
//  JadenCasingStringsTests
//
//  Created by Terrell Payne on 1/26/24.
//

import XCTest

class SolutionTest2: XCTestCase {
    
    func maskify(_ str:String) -> String {
      // TODO Your code goes here!
        if str.count <= 4 {
            return str
        }
        
        let maskedRange = str.index(str.endIndex, offsetBy: -4)
        let maskedPart = String( repeating: "#", count: str.distance(from: str.startIndex, to: maskedRange))
        let lastFour = String(str.suffix(4))
        return maskedPart + lastFour
    }
    
    static var allTests = [
        ("testMaskify", testMaskify),
    ]

    func testMaskify() {
        XCTAssertEqual(maskify("4556364607935616"), "############5616")
        XCTAssertEqual(maskify("333222"), "##3222")
        XCTAssertEqual(maskify("11111"), "#1111")
    }
    
}
