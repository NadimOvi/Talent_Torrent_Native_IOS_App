//
//  StackViewIBDesignable.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

@IBDesignable
class StackViewIBDesignable: UIStackView {
    
    @IBInspectable
    var hide: Bool {
        get {
            return isHidden
        }
        set {
            isHidden = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable
    var isRoundedCorners: Bool = false {
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


