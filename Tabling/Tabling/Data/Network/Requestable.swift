//
//  Requestable.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

enum HTTPMethod: String {
    case get
    
    var value: String {
        self.rawValue.uppercased()
    }
}

protocol Requestable {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var url: URL? { get }
    var urlRequest: URLRequest? { get }
}
