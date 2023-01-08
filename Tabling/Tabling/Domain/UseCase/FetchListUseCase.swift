//
//  FetchListUseCase.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

final class FetchListUseCase {
    private let repository: ListRepository

    init(repository: ListRepository) {
        self.repository = repository
    }
    
    func start<T: Decodable>(_ type: T.Type, request: URLRequest, completion: @escaping (Result<T, NetworkError>) -> Void) {
        repository.fetchList(T.self, request: request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.requestFailed))
            }
        }
    }
}
