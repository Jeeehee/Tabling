//
//  CollectionViewCell.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/03.
//

import UIKit

class TabCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .black : .lightGray
        }
    }
}

// MARK: - Inject Data
extension TabCollectionViewCell {
    func configureCellData(_ title: String) {
        titleLabel.text = title
    }
}
