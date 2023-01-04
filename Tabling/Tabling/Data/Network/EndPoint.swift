//
//  EndPoint.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

enum EndPoint {
    case save, resent
}

extension EndPoint: Requestable {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "my-json-server.typicode.com"
    }
    
    var path: String {
        switch self {
        case .save: return "/tabling/tabling_mobile_test/save"
        case .resent: return "/tabling/tabling_mobile_test/recent"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var url: URL? {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = path
        return urlComponent.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.value
        return request
    }
}
