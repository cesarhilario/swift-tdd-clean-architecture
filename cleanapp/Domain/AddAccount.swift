//
//  AddAccount.swift
//  Domain
//
//  Created by Cesar Hilario on 28/03/23.
//

import Foundation

protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, Error>) -> Void) ;
}

struct AddAccountModel {
    var name: String;
    var email: String;
    var password: String;
    var passwordConfirmation: String;
}

