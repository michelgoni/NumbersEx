//
//  File.swift
//  
//
//  Created by Michel Goñi on 2/5/23.
//

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct ShowModifier: ViewModifier {
    var active: Bool

    public func body(content: Content) -> some View {
        if active {
            content
        }
    }
}
