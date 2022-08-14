//
//  AddAccount.swift
//  Domain
//
//  Created by Cesar Hilario on 14/08/22.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void)
}

public struct AddAccountModel: Model {
    var name: String;
    var email: String;
    var password: String;
    var passwordConfirmation: String;
    
    public init(name: String, email: String, password: String, passwordConfirmation: String) {
        self.name = name;
        self.email = email;
        self.password = password;
        self.passwordConfirmation = passwordConfirmation;
    }
}
