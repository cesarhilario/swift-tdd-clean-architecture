//
//  AddAccount.swift
//  Domain
//
//  Created by Cesar Hilario on 14/08/22.
//

import Foundation

protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void)
}

struct AddAccountModel {
    var name: String;
    var email: String;
    var password: String;
    var passwordConfirmation: String;
}
