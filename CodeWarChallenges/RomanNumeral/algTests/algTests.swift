//
//  algTests.swift
//  algTests
//
//  Created by Terrell Payne on 1/20/24.
//

import XCTest
import Foundation
@testable import alg

class SolutionTest: XCTestCase {
//    func solution(_ string:String) -> Int {
//        let roadMap: [Character: Int] = ["I": 1, "V": 5,"X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
//        var result = 0
//        let characters = Array(string)
//
//        for i in 0..<characters.count {
//            if i < characters.count - 1, let currentVal = roadMap[characters[i]], let nextVal = roadMap[characters[i + 1]], currentVal < nextVal {
//                result -= currentVal
//            } else if let val = roadMap[characters[i]] {
//                result += val
//            }
//        }
//        
//        return result
//    }
//    static var allTests = [
//        ("testOneThroughTen", testOneThroughTen),
//        ("testBigNumbers", testBigNumbers),
//    ]
//    func value(of numeral: Character) -> Int? {
//        switch numeral {
//        case "I": return 1
//        case "V": return 5
//        case "X": return 10
//        case "L": return 50
//        case "C": return 100
//        case "D": return 500
//        case "M": return 1000
//        default: return nil
//        }
//    }
//
//    func solution(_ string: String) -> Int {
//        let numerals = string.compactMap(value)
//        let sum = numerals.reduce(0, +)
//        
//        let difference = zip(numerals, numerals.dropFirst())
//            .filter(<)
//            .map { $0.0 }
//            .reduce(0, +)
//        
//        return sum - difference * 2
//    }

    func solution(_ string:String) -> Int {
        let table: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var p = 0
        let transform: (Character) -> Int = {
            let result = table[$0]!
            if result > p { p = result }
            return result < p ? -result : result
        }
        return string.reversed().map(transform).reduce(0, +)
    }
    
    func testOneThroughTen() {
        XCTAssertEqual(solution("I"), 1)
        XCTAssertEqual(solution("II"), 2)
        XCTAssertEqual(solution("III"), 3)
        XCTAssertEqual(solution("IV"), 4)
        XCTAssertEqual(solution("V"), 5)
        XCTAssertEqual(solution("VI"), 6)
        XCTAssertEqual(solution("VII"), 7)
        XCTAssertEqual(solution("VIII"), 8)
        XCTAssertEqual(solution("IX"), 9)
        XCTAssertEqual(solution("X"), 10)
    }
    
    func testBigNumbers() {
        XCTAssertEqual(solution("C"), 100)
        XCTAssertEqual(solution("CDXLIV"), 444)
        XCTAssertEqual(solution("M"), 1000)
        XCTAssertEqual(solution("MCMLIV"), 1954)
        XCTAssertEqual(solution("MCMXC"), 1990)
        XCTAssertEqual(solution("MCMXCIX"), 1999)
        XCTAssertEqual(solution("MM"), 2000)
        XCTAssertEqual(solution("MMVIII"), 2008)
        XCTAssertEqual(solution("MMM"), 3000)
        XCTAssertEqual(solution("MMMCM"), 3900)
        XCTAssertEqual(solution("MMMCMXIV"), 3914)
    }
    
  }


