//
//  CollectionViewIBDesignable.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 19/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

@IBDesignable
class CollectionViewIBDesignable: UICollectionView {
    
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
