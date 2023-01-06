//
//  SaveCollectionViewCell.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

final class SaveCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var detailInfoStackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var numberOfReviewLabel: UILabel!
    @IBOutlet weak var watingLabel: UILabel!
    @IBOutlet weak var badgeLabel: PaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
        backgroundColor = .white
        imageView.backgroundColor = .black
        
    }
    
    private func configureViews() {
        contentStackView.setCustomSpacing(10, after: detailInfoStackView)
        detailInfoStackView.setCustomSpacing(15, after: numberOfReviewLabel)
        imageView.layer.cornerRadius = 10
        
        categoryLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        locationLabel.font = .init(name: Font.NotoSans.regular, size: 13)
        nameLabel.font = .init(name: Font.NotoSans.medium, size: 21)
        ratingLabel.font = .init(name: Font.NotoSans.regular, size: 14)
        numberOfReviewLabel.font = .init(name: Font.NotoSans.regular, size: 14)
        watingLabel.font = .init(name: Font.NotoSans.regular, size: 14)
        setUpBadgeLabel()
    }
    
    private func setUpBadgeLabel() {
        badgeLabel.font = .init(name: Font.NotoSans.medium, size: 13)
        badgeLabel.textColor = .tablingRed
        badgeLabel.layer.cornerRadius = 16
        badgeLabel.padding = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        badgeLabel.layer.borderWidth = 1
        badgeLabel.layer.borderColor = UIColor.tablingRed!.cgColor
    }
}

extension SaveCollectionViewCell {
    func configureCellData(_ model: Restaurant?) {
        guard let model = model else { return }
        
        categoryLabel.text = model.classification
        locationLabel.text = model.summaryAddress
        nameLabel.text = model.restaurantName
        ratingLabel.text = "\(model.rating)"
        numberOfReviewLabel.text = "(\(model.reviewCount))"
        watingLabel.text = "대기 \(model.waitingCount)명"
    }
}
