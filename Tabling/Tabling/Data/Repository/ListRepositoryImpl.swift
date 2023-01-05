//
//  ListRepositoryImpl.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

protocol ResponseDecoder {
    func decode<T: Decodable>(_ type: T.Type, _ data: Data?, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
}

final class ListRepositoryImpl {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

extension ListRepositoryImpl: ListRepository, ResponseDecoder {
    func fetchList<T: Decodable>(_ type: T.Type, request: URLRequest, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        networkService.dataTask(request: request) { result in
            
            switch result {
            case .success(let data):
                self.decode(T.self, data) { decodeResult in
                    switch decodeResult {
                    case .success(let decodeData):
                        completionHandler(.success(decodeData))
                    case .failure(let error):
                        completionHandler(.failure(.error(error: error)))
                    }
                }
            case .failure(let error):
                completionHandler(.failure(.error(error: error)))
            }
        }
    }
    
    func decode<T: Decodable>(_ type: T.Type, _ data: Data?, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            guard let data = data else { completionHandler(.failure(.emptyData)); return }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else { return }
            completionHandler(.success(decodedResponse))
        } catch {
            completionHandler(.failure(.decodeFailed))
        }
    }
}
