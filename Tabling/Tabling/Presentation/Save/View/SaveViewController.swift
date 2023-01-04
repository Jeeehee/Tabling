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
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    private let tabCollectionViewDelegateNDataSource = TabCollectionViewDataSource()
    private let contentCollectionViewDelegateNDataSource = ContentsCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setUpTabCollectionView()
        setUpContentsCollectionView()
    }
    
    private func configureView() {
        titleLabel.text = "관심 매장"
        titleLabel.font = .init(name: Font.NotoSans.bold, size: 25)
    }
    
    private func setUpTabCollectionView() {
        tabCollectionView.delegate = tabCollectionViewDelegateNDataSource
        tabCollectionView.dataSource = tabCollectionViewDelegateNDataSource
        
        let nibName = UINib(nibName: TabCollectionViewCell.identifier, bundle: nil)
        tabCollectionView.register(nibName, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
        
        let indexPath = IndexPath(item: 0, section: 0)
        tabCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .right)
    }
    
    private func setUpContentsCollectionView() {
        contentsCollectionView.backgroundColor = .lightGray
        contentsCollectionView.delegate = contentCollectionViewDelegateNDataSource
        contentsCollectionView.dataSource = contentCollectionViewDelegateNDataSource
        
        let nibName = UINib(nibName: SaveCollectionViewCell.identifier, bundle: nil)
        contentsCollectionView.register(nibName, forCellWithReuseIdentifier: SaveCollectionViewCell.identifier)
    }
}
