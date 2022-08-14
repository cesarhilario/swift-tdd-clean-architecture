//
//  ExtensionsHelpers.swift
//  Data
//
//  Created by Cesar Hilario on 14/08/22.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self);
    }
}

