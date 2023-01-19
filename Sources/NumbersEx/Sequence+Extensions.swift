//
//  File.swift
//  
//
//  Created by Michel Goñi on 19/1/23.
//

import Foundation

extension Sequence {
    public func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
