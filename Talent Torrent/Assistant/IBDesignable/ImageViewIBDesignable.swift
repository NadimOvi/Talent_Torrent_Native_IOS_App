//
//  ImageView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 16/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

@IBDesignable
class ImageViewIBDesignable: UIImageView {

    @IBInspectable var isRoundedCorners: Bool = false {
        didSet { setNeedsLayout() }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if isRoundedCorners {
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = UIBezierPath(ovalIn:
                CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height
            )).cgPath
            layer.mask = shapeLayer
        }
        else {
            layer.mask = nil
        }

    }

}
