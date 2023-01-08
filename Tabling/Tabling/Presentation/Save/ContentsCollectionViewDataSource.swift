//
//  ContentsCollectionViewDataSource.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

final class ContentsCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var imageUseCase: FetchImageUseCase?
    var viewModel: ListViewModelProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.value.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaveCollectionViewCell.identifier, for: indexPath) as? SaveCollectionViewCell else { return UICollectionViewCell() }
        let data = viewModel?.items.value[indexPath.item]
        cell.configureCellData(useCase: imageUseCase, with: data)
        return cell
    }
    
    // MARK: FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 120)
    }
}
