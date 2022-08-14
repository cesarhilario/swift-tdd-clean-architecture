//
//  RemoteAddAccount.swift
//  Data
//
//  Created by Cesar Hilario on 14/08/22.
//

import Foundation
import Domain

public final class RemoteAddAccount: AddAccount {
    private let url: URL;
    
    private let httpClient: HttpPostClient;
    
    public init(url: URL, httpClient: HttpPostClient) {
        self.url = url;
        self.httpClient = httpClient;
    }
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        httpClient.post(to: url, with: addAccountModel.toData()) { error in
            completion(.failure(.unexpected));
        };
    }
}
