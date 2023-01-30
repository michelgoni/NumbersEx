//
//  View+Extensions.swift
//  
//
//  Created by Michel Goñi on 30/1/23.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {
    func shadowNormal(color: Color = .shadow()) -> some View {
        shadow(color: color, radius: 5, x: 2, y: 2)
    }

    func eraseToButton(_ action: @escaping () -> Void) -> Button<Self> {
        Button(action: action, label: {
            self
        })
    }

    func scrollable(_ axis: Axis.Set = .vertical, showIndicators: Bool = true) -> ScrollView<Self> {
        ScrollView(axis, showsIndicators: showIndicators) { self }
    }
}
