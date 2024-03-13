//
//  UserPresenter.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

protocol UsersPresenter {
    func loadUsers()
    func presentUsers(_ users: [User])
    func presentError(_ error: Error)
    func didSelectUser(_ usermodel: UserViewModel)
}
