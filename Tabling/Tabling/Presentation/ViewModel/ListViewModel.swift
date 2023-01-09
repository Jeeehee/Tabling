//
//  ListViewModel.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

protocol ListViewModelInput {
    func viewDidLoad()
    func didChangeTab(_ index: Int)
    func didSelectCell(_ index: Int)
}

protocol ListViewModelOutput {
    var items: Observable<[ListItemViewModel]> { get }
    var selectItem: Observable<[ListItemViewModel]> { get }
    var imageUseCase: Observable<FetchImageUseCase> { get }
}

protocol ListViewModelProtocol: ListViewModelInput, ListViewModelOutput {
    var input: ListViewModelInput { get }
    var output: ListViewModelOutput { get }
}

final class ListViewModel: ListViewModelProtocol {
    var input: ListViewModelInput { self }
    var output: ListViewModelOutput { self }
    
    private let listUseCase: FetchListUseCase
    private var list: [Restaurant] = []
    
    // MARK: - OUTPUT
    var items: Observable<[ListItemViewModel]> = Observable([])
    var selectItem: Observable<[ListItemViewModel]> = Observable([])
    let imageUseCase: Observable<FetchImageUseCase>

    init(listUseCase: FetchListUseCase, imageUseCase: FetchImageUseCase) {
        self.listUseCase = listUseCase
        self.imageUseCase = Observable(imageUseCase)
    }
    
    private func load(_ type: EndPoint) {
        guard let urlRequest = type.urlRequest else { return }
        listUseCase.start(List.self, request: urlRequest) { [weak self] result in
            switch result {
            case .success(let data):
                self?.list = data.list
                self?.mappingData()
            case .failure(let error):
                fatalError("\(error)")
            }
        }
    }
}

extension ListViewModel {
    // MARK: - INPUT, View event methods
    func viewDidLoad() {
        load(.save)
    }
    
    func didChangeTab(_ index: Int) {
        switch index {
        case 0: load(.save)
        default: load(.resent)
        }
    }
    
    func didSelectCell(_ index: Int) {
        selectItem.value = [items.value[index]]
    }
    
    // MARK: - Private function
    private func mappingData() {
        items.value = list.map { ListItemViewModel.init(useCase: imageUseCase.value, restatrants: $0) }
    }
}
