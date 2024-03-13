//
//  UserRepository.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

protocol UserRepository {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void)
}
