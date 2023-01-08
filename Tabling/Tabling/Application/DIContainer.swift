//
//  DIContainer.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/06.
//

import UIKit

final class DIContainer {
    // MARK: - Service
    private let networkService = NetworkService()
    
    // MARK: - Persistent Storage
    lazy var imageCacheStorage = ImageCacheStorage()
    
    // MARK: - Repositories
    func makeListRepository() -> ListRepository {
        return ListRepositoryImpl(networkService: networkService)
    }
    
    func makeImageRepository() -> ImageRepository {
        return ImageRepositoryImpl(cache: imageCacheStorage)
    }
    
    // MARK: - Use Cases
    func makeFetchListUseCase() -> FetchListUseCase {
        return FetchListUseCase(repository: makeListRepository())
    }
    
    func makeFetchImageUseCase() -> FetchImageUseCase {
        return FetchImageUseCase(repository: makeImageRepository())
    }
    
    // MARK: - ViewModel
    func makeListViewModel() -> ListViewModelProtocol {
        return ListViewModel(listUseCase: makeFetchListUseCase(), imageUseCase: makeFetchImageUseCase())
    }
}
