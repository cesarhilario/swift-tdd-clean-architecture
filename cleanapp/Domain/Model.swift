//
//  Model.swift
//  Domain
//
//  Created by Cesar Hilario on 28/03/23.
//

import Foundation


public protocol Model: Encodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self);
    }
}