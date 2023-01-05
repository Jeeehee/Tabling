//
//  URLSessionProtocol.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
