//
//  ImageRepository.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

protocol ImageRepository {
    func loadImage( _ url: String, completionHandler: @escaping (Data?) -> Void)
}
