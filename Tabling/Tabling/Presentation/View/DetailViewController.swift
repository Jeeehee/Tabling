//
//  DetailViewController.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/08.
//

import UIKit

class DetailViewController: UIViewController {
    var viewModel: ListItemViewModel?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailInfoStackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var numberOfReviewLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var additionalLabel: UILabel!
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        configuerCellData()
    }
    
    private func setUpViews() {
        stackView.setCustomSpacing(20, after: descriptionLabel)
        detailInfoStackView.setCustomSpacing(15, after: numberOfReviewLabel)
        
        categoryLabel.font = .init(name: Font.NotoSans.medium, size: 13)
        nameLabel.font = .init(name: Font.NotoSans.medium, size: 26)
        descriptionLabel.font = .init(name: Font.NotoSans.regular, size: 16)
        locationLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        ratingLabel.font = .init(name: Font.Roboto.regular, size: 14)
        numberOfReviewLabel.font = .init(name: Font.Roboto.regular, size: 14)
        
        additionalLabel.font = .init(name: Font.NotoSans.bold, size: 15)
        additionalLabel.layer.cornerRadius = 8
    }
    
    // MARK: - Inject Data
    private func configuerCellData() {
        guard let viewModel = viewModel else { return }
        
        categoryLabel.text = viewModel.classification
        nameLabel.text = viewModel.restaurantName
        descriptionLabel.text = "현재 대기 인원은 \(viewModel.waitingCount)명 입니다."
        ratingLabel.text = "\(viewModel.rating)"
        numberOfReviewLabel.text = "(\(viewModel.reviewCount))"
        locationLabel.text = viewModel.summaryAddress
        
        updateImage(viewModel.thumbnail)
        isRemoteWaiting(viewModel.isRemoteWaiting)
    }
}

// MARK: - ResraurantInfomationConvertible
extension DetailViewController: ResraurantInfomationConvertible {
    func updateImage(_ image: String) {
        viewModel?.useCase.start(image) { result in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: result)
            }
        }
    }
    
    func isRemoteWaiting(_ isRemoteWaiting: Bool) {
        switch isRemoteWaiting {
        case true: additionalLabel.text = BadgeType.remoteWaiting.title
        case false: additionalLabel.text = BadgeType.quickBooking.title
        }
    }
}
