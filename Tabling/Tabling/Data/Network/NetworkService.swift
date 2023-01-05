//
//  NetworkService.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/04.
//

import Foundation

class NetworkService {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func dataTask(request: URLRequest, completionHandler: @escaping (Result<Data?, NetworkError>) -> Void) {
        let task = session.dataTask(with: request) { data, response, error in
            guard self.errorCheck(data: data, response: response, error: error) == nil else {
                completionHandler(.failure(.requestFailed))
                return
            }
            
            guard let data = data else { return }
            
            completionHandler(.success(data))
        }
        
        task.resume()
    }
    
    func errorCheck(data: Data?, response: URLResponse?, error: Error?) -> NetworkError? {
        guard let httpResponse = response as? HTTPURLResponse, error == nil else {
            return .reponseFailed
        }
        
        guard (200 ... 299) ~= httpResponse.statusCode else {
            return .invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        guard data != nil else {
            return .emptyData
        }
         
        return nil
    }
}
