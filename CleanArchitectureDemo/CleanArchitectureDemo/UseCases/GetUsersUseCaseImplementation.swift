//
//  GetUsersUseCaseImplementation.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

class GetUsersUseCaseImplementation: GetUsersUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(completion: @escaping (Result<[User], Error>) -> Void) {
        userRepository.getUsers { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
