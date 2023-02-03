//
//  AsyncHandler.swift
//  
//
//  Created by Michel Goñi on 3/2/23.
//

import Foundation

public protocol AsyncHandler {
    var global: DispatchQueue { get }
    var main: DispatchQueue { get }
}

public extension AsyncHandler {
    var global: DispatchQueue { .global() }
    var main: DispatchQueue { DispatchQueue.main }

    func globalAsync(perform: @escaping Perform) {
        global.async(execute: perform)
    }

    func mainAsync(perform: @escaping Perform) {
        main.async(execute: perform)
    }

    func mainAsyncAfter(_ deadline: TimeInterval, perform: @escaping Perform) {
        main.asyncAfter(deadline: .now() + deadline, execute: perform)
    }
}
