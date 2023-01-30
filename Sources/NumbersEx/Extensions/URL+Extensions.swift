//
//  File.swift
//  
//
//  Created by Michel Goñi on 18/1/23.
//

import Foundation

extension URL: ExpressibleByStringLiteral {

    /**
        Create a URL using a simple String so that you don´t need to force unwrapp

        - Returns: let url: URL = "https://www.test.com" as a simple URL
        */


    public init(stringLiteral value: String) {
        self = URL(string: value)!
    }
}
