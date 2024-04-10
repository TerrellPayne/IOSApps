//
//  SolutionTest4.swift
//  JadenCasingStringsTests
//
//  Created by Terrell Payne on 2/18/24.
//

import XCTest

final class SolutionTest4: XCTestCase {
    //Returns the sum for all numbers that are multiples of 3 or 5 for a given number
    func solution(_ num: Int) -> Int {
        // Check for negative input
        guard num > 0 else {
            return 0
        }
        
        var sum = 0
        
        for i in 1..<num {
            if i % 3 == 0 || i % 5 == 0 {
                sum += i
            }
        }
        
        return sum
    }
    
    
    
    static var allTests = [
            ("Test Solution", testSolution),
        ]

        func testSolution() {
            XCTAssertEqual(solution(10), 23)
            XCTAssertEqual(solution(20), 78)
            XCTAssertEqual(solution(200), 9168)
        }


}
