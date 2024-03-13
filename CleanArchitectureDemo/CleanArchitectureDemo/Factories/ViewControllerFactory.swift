//
//  ViewControllerFactory.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/13/24.
//

import Foundation

class ViewControllerFactory {
    static func createUserViewController() -> UsersViewController {
        let userRepository = UserRepositoryImplementation()
        let getUsersUseCase = GetUsersUseCaseImplementation(userRepository: userRepository)
        let router = UsersRouterImplement()
        let viewController = UsersViewController()
        let presenter = UsersPresenterImplementation(view: viewController, getUsersUseCase: getUsersUseCase, router: router)

        router.viewController = viewController
        viewController.usersPresenter = presenter

        return viewController
    }
}
