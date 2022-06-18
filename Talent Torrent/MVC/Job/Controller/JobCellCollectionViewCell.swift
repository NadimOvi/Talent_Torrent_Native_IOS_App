//
//  JobCellCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

class JobCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var skillLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCellProperty(_ data: String?) {
        skillLabel.text = data ?? ""
    }

}
