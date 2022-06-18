//
//  LabelIBDesignable.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

@IBDesignable
class LabelIBDesignable: UILabel {
    
    @IBInspectable
    var hide: Bool {
        get {
            return isHidden
        }
        set {
            isHidden = newValue
        }
    }
}
