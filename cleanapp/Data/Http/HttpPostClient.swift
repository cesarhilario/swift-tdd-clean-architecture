//
//  HttpPostClient.swift
//  Data
//
//  Created by Cesar Hilario on 28/03/23.
//

import Foundation


public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (HttpError) -> Void);
}
