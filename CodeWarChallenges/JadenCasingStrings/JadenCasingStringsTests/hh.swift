//
//  hh.swift
//  JadenCasingStringsTests
//
//  Created by Terrell Payne on 2/4/24.
//

import XCTest
import Foundation


//Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.
class SolutionTest3: XCTestCase {
    func inArray(_ a1: [String], _ a2: [String]) -> [String] {
        // your code
        let a3 = a1.filter { a2.contains($0)}
        
        let sortArray = a3.sorted()
        
        print(sortArray)
        
        return sortArray
    }
    
    static var allTests = [
        ("inArray", testExample),
    ]

    func testing(_ a1: [String], _ a2: [String], _ expected: [String]) {
        print(inArray(a1, a2))
       
        print(expected)
        XCTAssertTrue(inArray(a1, a2) == expected, "should return \(expected)")
    }
     
    func testExample() {
//        var a1 = ["live", "arp", "strong"]
//        var a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
//        var r = ["arp", "live", "strong"]
//        testing(a1, a2, r)
           
       var a1 = ["arp", "mice", "bull"]
        var a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
       var r = ["arp"]
        testing(a1, a2, r)
    }
}
   
