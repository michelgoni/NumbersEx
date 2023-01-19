//
//  File.swift
//  
//
//  Created by Michel Goñi on 19/1/23.
//

import SwiftUI

@available(iOS 13.0, *)
extension View {

    public func initializeAlert(_ alertManager: AlertView) -> some View {
       self.modifier(AlertViewModifier(alert: alertManager))
   }

    public func onAppearOnce(_ action: @escaping () -> ()) -> some View {
        modifier(OnAppearOnce(action: action))
    }

    public func show(_ condition: Bool) -> some View {
        modifier(ShowModifier(active: condition))
    }


    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }

}
