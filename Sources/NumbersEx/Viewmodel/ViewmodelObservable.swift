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
    associatedtype Datasource: Equatable
    associatedtype Destination: Equatable
    
    var dataSource: Datasource { get }
    
    func trigger(_ input: Input)
    
}
