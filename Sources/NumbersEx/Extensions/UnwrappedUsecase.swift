//
//  UnwrappedUsecase.swift
//  
//
//  Created by Michel Goñi on 3/2/23.
//

import Foundation

public protocol UnwrappedUseCase {}

public extension UnwrappedUseCase {

    /// Use this extension in order to handle an optional value. In case it´s nil, a throw will be
    /// returned.
    ///
    /// - Parameters
    ///     - executor: Generic output

    func execute<Output>(_ executor: Output?) throws -> Output {
        guard let executor = executor else {
            throw NSError(domain: "Invalid output", code: -1)
        }

        return executor
    }
}
