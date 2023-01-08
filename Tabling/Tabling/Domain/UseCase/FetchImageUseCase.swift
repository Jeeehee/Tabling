//
//  FetchImageUseCase.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

final class FetchImageUseCase {
    private let repository: ImageRepository

    init(repository: ImageRepository) {
        self.repository = repository
    }
    
    func start(_ url: String, completionHandler: @escaping (Data) -> Void) {
        repository.fetchImage(url) { imageData in
            guard let imageData = imageData else { return }
            completionHandler(imageData)
        }
    }
}
