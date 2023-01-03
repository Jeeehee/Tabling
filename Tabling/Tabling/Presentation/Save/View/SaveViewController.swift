//
//  ViewController.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

class SaveViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpTabCollectionView()
    }
    
    private func configureView() {
        titleLabel.text = "관심 매장"
        titleLabel.font = .init(name: Font.NotoSans.bold, size: 25)
    }
    
    private func setUpTabCollectionView() {
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        
        let nibName = UINib(nibName: TabCollectionViewCell.identifier, bundle: nil)
        tabCollectionView.register(nibName, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
        let indexPath = IndexPath(item: 0, section: 0)
        tabCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
    }
}

extension SaveViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
