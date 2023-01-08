//
//  ViewController.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

class SaveViewController: UIViewController {
    private var viewModel: ListViewModelProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var contentsCollectionView: UICollectionView!
    
    private let tabCollectionViewDelegateNDataSource = TabCollectionViewDataSource()
    private let contentCollectionViewDelegateNDataSource = ContentsCollectionViewDataSource()

    init?(coder: NSCoder, viewModel: ListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }

        setupViews()
        setUpTabCollectionView()
        setUpContentsCollectionView()
        bind(to: viewModel)
        viewModel.input.viewDidLoad()
    }
    
    private func bind(to viewModel: ListViewModelProtocol) {
        viewModel.items.observe(on: self) { _ in
            self.contentCollectionViewDelegateNDataSource.viewModel = viewModel
            self.contentCollectionViewDelegateNDataSource.imageUseCase = viewModel.imageUseCase.value
            
            DispatchQueue.main.async {
                self.contentsCollectionView.reloadData()
            }
        }
    }
    
    private func setupViews() {
        titleLabel.text = "관심 매장"
        titleLabel.font = .init(name: Font.NotoSans.bold, size: 25)
    }
    
    private func setUpTabCollectionView() {
        tabCollectionView.delegate = tabCollectionViewDelegateNDataSource
        tabCollectionView.dataSource = tabCollectionViewDelegateNDataSource
        tabCollectionViewDelegateNDataSource.delegate = self
        
        let nibName = UINib(nibName: TabCollectionViewCell.identifier, bundle: nil)
        tabCollectionView.register(nibName, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
        
        let indexPath = IndexPath(item: 0, section: 0)
        tabCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .right)
    }
    
    private func setUpContentsCollectionView() {
        contentsCollectionView.delegate = contentCollectionViewDelegateNDataSource
        contentsCollectionView.dataSource = contentCollectionViewDelegateNDataSource
        
        let nibName = UINib(nibName: SaveCollectionViewCell.identifier, bundle: nil)
        contentsCollectionView.register(nibName, forCellWithReuseIdentifier: SaveCollectionViewCell.identifier)
    }
    
    private func updateItems() {
        DispatchQueue.main.async {
            self.contentsCollectionView.reloadData()
        }
    }
}

extension SaveViewController: TabCollectionViewDelegate {
    func scrollToIndex(to index: Int) {
        viewModel?.didChangeTab(index)
    }
}
