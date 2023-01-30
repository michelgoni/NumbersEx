//
//  Int+Extensions.swift
//  
//
//  Created by Michel Goñi on 18/1/23.
//

import Foundation

extension Int {

    /**
        Check if the number is prime

        - Returns: a boolean indicating thet the humber is (or not) prime
        */

    public var isPrime: Bool {
      guard self >= 2 else { return false }

      for i in 2..<self {
          if self % i == .zero {
          return false
        }
      }
      return true
    }
}

