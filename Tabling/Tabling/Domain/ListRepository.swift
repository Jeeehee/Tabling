//
//  ListRepository.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

protocol ListRepository {
    func fetchList<T: Decodable>(_ type: T.Type, request: URLRequest, completionHandler: @escaping (Result<T, NetworkError>) -> Void)
}
