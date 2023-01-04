//
//  NetworkError.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

enum NetworkError: Error {
    case invalidStatusCode(statusCode: Int)
    case invalidURL
    case emptyData
    case decodeFailed
}
