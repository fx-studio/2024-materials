//
//  UserPresenterImplementation.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

class UsersPresenterImplementation: UsersPresenter {
    private weak var view: UsersView?
    private let getUsersUseCase: GetUsersUseCase
    private let router: UsersRouter

    init(view: UsersView, getUsersUseCase: GetUsersUseCase, router: UsersRouter) {
        self.view = view
        self.getUsersUseCase = getUsersUseCase
        self.router = router
    }

    func loadUsers() {
        getUsersUseCase.execute { [weak self] result in
            switch result {
            case .success(let users):
                self?.presentUsers(users)
            case .failure(let error):
                self?.presentError(error)
            }
        }
    }

    func presentUsers(_ users: [User]) {
        let userViewModels = users.map { UserViewModel(id: $0.id, name: $0.name, email: $0.email) }
        view?.displayUsers(userViewModels)
    }

    func presentError(_ error: Error) {
        view?.displayError(error.localizedDescription)
    }

    func didSelectUser(_ usermodel: UserViewModel) {
        let user = User(id: usermodel.id, name: usermodel.name, email: usermodel.email)
        router.navigateToUserDetail(user: user)
    }
}
