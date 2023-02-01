//
//  Int+Extensions.swift
//  
//
//  Created by Michel Goñi on 18/1/23.
//

import Foundation

public extension Int {

    /**
     Check if the number is prime

     - Returns: A boolean indicating thet the humber is (or not) prime
     */

    var isPrime: Bool {
        guard self >= 2 else { return false }

        for i in 2..<self {
            if self % i == .zero {
                return false
            }
        }
        return true
    }

    /**
     Check if the number is even (divisible by 2)

     - Returns: A boolean indicating thet the humber is (or not) even
     */
    var isEven: Bool {
        self % 2 == .zero
    }
    /**
     Check if the number is odd (not divisible by 2)

     - Returns: A boolean indicating thet the humber is (or not) odd
     */
    var isOdd: Bool {
        self % 2 != .zero
    }
}

