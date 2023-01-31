//
//  OperationalFlow.swift
//  
//
//  Created by Michel Goñi on 30/1/23.
//

import Combine

@available(iOS 13.0, *)
public protocol OperationalFlow {

    associatedtype Input
    associatedtype Element
    typealias Output = PassthroughSubject<Element, Never>

    var input: Input { get }
    var output: Output { get }
}
