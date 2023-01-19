//
//  AlertViewModfier.swift
//  Numbers
//
//  Created by Michel Goñi on 3/1/23.
//

import SwiftUI
@available(iOS 13.0, *)
public struct AlertViewModifier: ViewModifier {

    @ObservedObject var alert: AlertView

    public func body(content: Content) -> some View {
           content.alert(isPresented: $alert.showAlertView) {
               alert.getSystemAlert
           }
       }
}
