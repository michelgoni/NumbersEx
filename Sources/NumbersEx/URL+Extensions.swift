//
//  File.swift
//  
//
//  Created by Michel Goñi on 18/1/23.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
