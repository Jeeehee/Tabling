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
        titleLabel.font = .init(name: Font.NotoSans.medium, size: 16)
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? .black : .lightGray
        }
    }
    
}

extension TabCollectionViewCell {
    func configureCellData(_ title: String) {
        titleLabel.text = title
    }
}
