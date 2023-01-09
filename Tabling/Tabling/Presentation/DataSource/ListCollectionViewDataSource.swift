//
//  ListCollectionViewDataSource.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

protocol ListCollectionViewDelegate: AnyObject {
    func selectedCell(to index: Int)
}

final class ListCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    weak var delegate: ListCollectionViewDelegate?
    var viewModel: ListViewModelProtocol?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.value.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
        let data = viewModel?.items.value[indexPath.item]
        cell.configureCellData(with: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedCell(to: indexPath.item)
    }
    
    // MARK: FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 120)
    }
}
