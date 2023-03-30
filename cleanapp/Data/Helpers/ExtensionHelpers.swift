//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Cesar Hilario on 29/03/23.
//

import Foundation

extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self);
    }
}
