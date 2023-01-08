//
//  TabCollectionViewDataSource.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

protocol TabCollectionViewDelegate: AnyObject {
    func scrollToIndex(to index: Int)
}

final class TabCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    weak var delegate: TabCollectionViewDelegate?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else { return UICollectionViewCell() }
        
        guard let tabType = TabType.init(rawValue: indexPath.item) else { return UICollectionViewCell() }
        
        switch tabType {
        case .save: cell.configureCellData(TabType.save.title)
        case .resent: cell.configureCellData(TabType.resent.title)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToIndex(to: indexPath.row)
    }
}
