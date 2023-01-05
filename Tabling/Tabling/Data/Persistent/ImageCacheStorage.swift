//
//  ImageCacheStorage.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import UIKit

final class ImageCacheStorage {
    private let cache = NSCache<NSURL, NSData>()
    
    func stringToNSURL(_ url: String) -> NSURL? {
        guard let url = NSURL(string: url) else { return nil }
        return url
    }
    
    func checkCache(for key: NSURL) -> Data? {
        return cache.object(forKey: key) as? Data
    }
                            
    func store(_ data: Data, _ forKey: NSURL) {
        cache.setObject(data as NSData, forKey: forKey)
    }
}
