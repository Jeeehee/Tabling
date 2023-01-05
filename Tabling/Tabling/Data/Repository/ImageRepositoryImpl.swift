//
//  ImageRepositoryImpl.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

final class ImageRepositoryImpl {
    private let cache: ImageCacheStorage
    
    init(cache: ImageCacheStorage) {
        self.cache = cache
    }
}

extension ImageRepositoryImpl: ImageRepository {
    func loadImage( _ url: String, completionHandler: @escaping (Data?) -> Void) {
        guard let cacheKey = cache.stringToNSURL(url) else { return }
        guard cache.checkCache(for: cacheKey) == nil else {
            completionHandler(cache.checkCache(for: cacheKey))
            return
        }
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            
            self?.cache.store(data, cacheKey)
            
            DispatchQueue.main.async {
                completionHandler(data)
            }
            
        }.resume()
    }
    
}
