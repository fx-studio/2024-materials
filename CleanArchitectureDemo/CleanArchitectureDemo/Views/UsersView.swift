//
//  UserView.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

protocol UsersView: AnyObject {
    func displayUsers(_ users: [UserViewModel])
    func displayError(_ message: String)
}
