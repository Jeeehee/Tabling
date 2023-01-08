//
//  MainViewController.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

class MainViewController: UIViewController {
    private var viewModel: ListViewModelProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    private let tabCollectionViewDelegateNDataSource = TabCollectionViewDataSource()
    private let listCollectionViewDelegateNDataSource = ListCollectionViewDataSource()

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
            self.listCollectionViewDelegateNDataSource.viewModel = viewModel
            self.listCollectionViewDelegateNDataSource.imageUseCase = viewModel.imageUseCase.value
            
            DispatchQueue.main.async {
                self.listCollectionView.reloadData()
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
        listCollectionView.delegate = listCollectionViewDelegateNDataSource
        listCollectionView.dataSource = listCollectionViewDelegateNDataSource
        
        let nibName = UINib(nibName: ListCollectionViewCell.identifier, bundle: nil)
        listCollectionView.register(nibName, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
    }
    
    private func updateItems() {
        DispatchQueue.main.async {
            self.listCollectionView.reloadData()
        }
    }
}

extension MainViewController: TabCollectionViewDelegate {
    func scrollToIndex(to index: Int) {
        viewModel?.didChangeTab(index)
    }
}
