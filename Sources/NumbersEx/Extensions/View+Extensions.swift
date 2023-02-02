//
//  View+Extensions.swift
//  
//
//  Created by Michel Goñi on 30/1/23.
//

import SwiftUI

@available(iOS 13.0, *)
public extension View {

    /// Use this method to apply TabItem modifier
    ///
    /// - Parameters:
    ///     - title: String with title of tab. *Nil by default*.
    ///     - image: Image of tab
    ///     - tag: Int with tag index
    ///
    /// ```
    /// SomeView()
    ///     .eraseToTabItem("TITLE", image: .numbers, tag: 0)
    /// ```


    func eraseToTabItem(_ title: String? = nil, image: Image, tag: Int) -> some View {
        padding(.bottom, 1)
            .tabItem {
                image
                if let title = title {
                    Text(title)
                }
            }
            .tag(tag)
    }

    /// Use this method to convert any view into a  Button
    ///
    /// ```
    /// SomeView()
    ///     .eraseToButton {
    ///         vieModel?.trigger....
    /// }
    /// ```

    func eraseToButton(_ action: @escaping () -> Void) -> Button<Self> {
        Button(action: action, label: {
            self
        })
    }

    func shadowNormal(color: Color = .shadow()) -> some View {
        shadow(color: color, radius: 5, x: 2, y: 2)
    }

    func scrollable(_ axis: Axis.Set = .vertical, showIndicators: Bool = true) -> ScrollView<Self> {
        ScrollView(axis, showsIndicators: showIndicators) { self }
    }
}
