//
//  File.swift
//  
//
//  Created by Michel Goñi on 30/1/23.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    static func shadow(opacity: Double = 0.3) -> Self { Color.gray.opacity(opacity)}
}
