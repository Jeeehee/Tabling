//
//  TabCollectionViewDataSource.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

final class TabCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else { return UICollectionViewCell() }
        
        guard let tabType = TabType.init(rawValue: indexPath.item) else { return UICollectionViewCell() }
        
        switch tabType {
        case .first: cell.configureCellData(TabType.first.title)
        case .second: cell.configureCellData(TabType.second.title)
        }
        
        return cell
    }
}
