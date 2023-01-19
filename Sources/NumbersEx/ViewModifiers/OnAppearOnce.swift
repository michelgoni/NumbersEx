//
//  OnAppearOnce.swift
//  Numbers
//
//  Created by Michel Goñi on 9/1/23.
//

import SwiftUI
@available(iOS 13.0, *)
public struct OnAppearOnce: ViewModifier {
    let action: () -> ()

    @State private var hasAppeared = false

    public func body(content: Content) -> some View {
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared.toggle()
            action()
        }
    }
}
