//
//  File.swift
//  
//
//  Created by Michel Goñi on 2/5/23.
//

import Foundation

public extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: self)
    }
}

