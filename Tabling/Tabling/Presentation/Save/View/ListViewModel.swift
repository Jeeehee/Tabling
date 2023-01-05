//
//  ListViewModel.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

protocol ListViewModelInput {
    func viewDidLoad()
}

protocol ListViewModelOutput {
//    var items: Observable<[List]> { get }
}

protocol ListViewModelProtocol: ListViewModelInput, ListViewModelOutput {
    var input: ListViewModelInput { get }
    var output: ListViewModelOutput { get }
}

final class ListViewModel: ListViewModelProtocol {
    var input: ListViewModelInput { self }
    var output: ListViewModelOutput { self }
    
    private let useCase: FetchListUseCase
    private var list: [List] = []
    
    init(fetchListUseCase: FetchListUseCase) {
        self.useCase = fetchListUseCase
    }
    
    private func load() {
        guard let urlRequest = EndPoint.save.urlRequest else { return }
        useCase.start(List.self, request: urlRequest) { [weak self] result in
            switch result {
            case .success(let data):
                self?.list = [data]
                print(data)
            case .failure(let failure):
                print("Error")
            }
        }
    }
}

extension ListViewModel {
    func viewDidLoad() {
        load()
    }
}
