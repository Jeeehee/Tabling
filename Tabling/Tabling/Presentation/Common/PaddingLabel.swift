//
//  PaddingLabel.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/06.
//

import UIKit

final class PaddingLabel: UILabel {
    var padding = UIEdgeInsets.zero

    override func drawText(in rect: CGRect) {
        let paddingRect = rect.inset(by: padding)
        super.drawText(in: paddingRect)
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        return contentSize
    }
}
