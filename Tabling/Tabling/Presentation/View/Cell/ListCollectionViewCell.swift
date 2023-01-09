//
//  ListCollectionViewCell.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

final class ListCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var categorizeStackView: UIStackView!
    @IBOutlet weak var detailInfoStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var numberOfReviewLabel: UILabel!
    @IBOutlet weak var watingLabel: UILabel!
    @IBOutlet weak var badgeLabel: PaddingLabel!
    @IBOutlet weak var isNewLabel: PaddingLabel!
    
    private var viewModel: ListItemViewModel?

    override func prepareForReuse() {
        imageView.image = nil
        categoryLabel.text = nil
        locationLabel.text = nil
        nameLabel.text = nil
        ratingLabel.text = nil
        numberOfReviewLabel.text = nil
        watingLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViews()
    }
    
    private func setUpViews() {
        setUpStackViews()
        imageView.layer.cornerRadius = 10
        isNewLabel.layer.cornerRadius = 7
        
        categoryLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        locationLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        nameLabel.font = .init(name: Font.NotoSans.medium, size: 18)
        ratingLabel.font = .init(name: Font.Roboto.regular, size: 14)
        numberOfReviewLabel.font = .init(name: Font.Roboto.regular, size: 14)
        watingLabel.font = .init(name: Font.NotoSans.regular, size: 14)
    }
    
    private func setUpStackViews() {
        categorizeStackView.setCustomSpacing(8, after: locationLabel)
        detailInfoStackView.setCustomSpacing(15, after: numberOfReviewLabel)
        contentStackView.setCustomSpacing(-5, after: categorizeStackView)
        contentStackView.setCustomSpacing(5, after: detailInfoStackView)
    }
    
    private func setUpPaddingLabel(to label: PaddingLabel, title: String, color: UIColor) {
        label.text = title
        label.font = .init(name: Font.NotoSans.medium, size: 13)
        label.textColor = color
        label.layer.cornerRadius = 16
        label.padding = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        label.layer.borderWidth = 1
        label.layer.borderColor = color.cgColor
    }
}

// MARK: - Inject Data
extension ListCollectionViewCell {
    func configureCellData(with model: ListItemViewModel?) {
        guard let model = model else { return }
        self.viewModel = model
        
        categoryLabel.text = model.classification
        locationLabel.text = model.summaryAddress
        nameLabel.text = model.restaurantName
        ratingLabel.text = "\(model.rating)"
        numberOfReviewLabel.text = "(\(model.reviewCount))"
        watingLabel.text = "대기 \(model.waitingCount)명"
        
        updateImage(model.thumbnail)
        isRemoteWaiting(model.isRemoteWaiting)
        isNew(model.isNew)
    }
    
    private func updateImage(_ image: String) {
        viewModel?.useCase.start(image) { result in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: result)
            }
        }
    }
    
    private func isRemoteWaiting(_ isRemoteWaiting: Bool) {
        switch isRemoteWaiting {
        case true: setUpPaddingLabel(to: badgeLabel, title: BadgeType.remoteWaiting.title, color: BadgeType.remoteWaiting.color)
        case false: setUpPaddingLabel(to: badgeLabel, title: BadgeType.quickBooking.title, color: BadgeType.quickBooking.color)
        }
    }
    
    private func isNew(_ isNew: Bool) {
        switch isNew {
        case true: isNewLabel.isHidden = false
        case false: isNewLabel.isHidden = true
        }
    }
}
