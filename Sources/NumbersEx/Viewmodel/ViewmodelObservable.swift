//
//  File.swift
//  
//
//  Created by Michel Goñi on 21/8/23.
//

import Foundation
import SwiftUI

public protocol ViewModelObservable: ObservableObject {
    associatedtype Input
    func trigger(_ input: Input)
}
