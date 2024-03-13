//
//  UserRepositoryImplementation.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

class UserRepositoryImplementation: UserRepository {

    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Giả lập việc lấy dữ liệu từ cơ sở dữ liệu hoặc API
        let users = [User(id: 1, name: "User 1", email: "user1@mail.com"),
                     User(id: 2, name: "User 2", email: "user1@mail.com")]
        completion(.success(users))
    }

    func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        // Giả lập việc lấy dữ liệu từ cơ sở dữ liệu hoặc API
        let user = User(id: id, name: "User \(id)", email: "user_xx@mail.com")
        completion(.success(user))
    }
}
