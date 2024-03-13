//
//  UserViewImplement.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

class UsersViewImplplement: UsersView {
    weak var controller: UsersViewController?
    
    func displayUsers(_ users: [UserViewModel]) {
        controller?.displayUsers(users)
    }
    
    func displayError(_ message: String) {
        controller?.displayError(message)
    }
}
