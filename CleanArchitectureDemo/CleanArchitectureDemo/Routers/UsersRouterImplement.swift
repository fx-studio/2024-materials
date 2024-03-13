//
//  UsersRouterImplement.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

class UsersRouterImplement: UsersRouter {
    weak var viewController: UsersViewController?

    func navigateToUserDetail(user: User) {
        let userDetailViewController = UserDetailViewController()
        userDetailViewController.user = user
        viewController?.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}
