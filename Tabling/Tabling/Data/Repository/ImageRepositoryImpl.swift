//
//  ImageRepositoryImpl.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

final class ImageRepositoryImpl {
    private let cache: ImageCacheStorage
    private let session: URLSession
    
    init(cache: ImageCacheStorage, session: URLSession = URLSession.shared) {
        self.cache = cache
        self.session = session
    }
}

extension ImageRepositoryImpl: ImageRepository {
    func fetchImage( _ url: String, completionHandler: @escaping (Data?) -> Void) {
        guard let cacheKey = cache.stringToNSURL(url) else { return }
        guard cache.checkCache(for: cacheKey) == nil else {
            completionHandler(self.cache.checkCache(for: cacheKey))
            return
        }
        
        guard let url = URL(string: url) else { return }
        
        session.downloadTask(with: url) { url, _, error in
            guard let url = url, error == nil else { return }
            
            do {
                let data = try Data(contentsOf: url)
                completionHandler(data)
                self.cache.store(data, cacheKey)
            } catch {
                completionHandler(nil)
            }
            
        }.resume()
    }
}
