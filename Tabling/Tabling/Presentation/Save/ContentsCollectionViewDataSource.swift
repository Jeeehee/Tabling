//
//  ContentsCollectionViewDataSource.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

final class ContentsCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var restaurantList: [Restaurant]?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        restaurantList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SaveCollectionViewCell.identifier, for: indexPath) as? SaveCollectionViewCell else { return UICollectionViewCell() }
        let data = fetchRestaurantList(index: indexPath)
        cell.configureCellData(data)
        return cell
    }
    
    // MARK: FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 130)
    }
}

// MARK: Custom Method
extension ContentsCollectionViewDataSource {
    private func fetchRestaurantList(index: IndexPath) -> Restaurant? {
        return restaurantList?[index.item]
    }
}
