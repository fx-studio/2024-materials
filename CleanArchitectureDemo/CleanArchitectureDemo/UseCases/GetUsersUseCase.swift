//
//  GetUsersUseCase.swift
//  CleanArchitectureDemo
//
//  Created by Tien Le P. VN.Danang on 3/12/24.
//

import Foundation

protocol GetUsersUseCase {
    func execute(completion: @escaping (Result<[User], Error>) -> Void)
}
