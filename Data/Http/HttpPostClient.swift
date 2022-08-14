//
//  HttpPostClient.swift
//  Data
//
//  Created by Cesar Hilario on 14/08/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void);
}
