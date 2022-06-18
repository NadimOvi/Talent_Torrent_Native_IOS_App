//
//  JobCreateSkillCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

protocol JobCreateSkillCollectionViewCellDataSource {
    func didSelectItemCloseButton(tag: Int)
}
class JobCreateSkillCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "JobCreateSkillCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "JobCreateSkillCollectionViewCell", bundle: nil)
    }
    var delegate: JobCreateSkillCollectionViewCellDataSource?
    
    @IBOutlet weak var favoriteItemLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    func setCellComponetProperty(cell: String, itemIndex: Int) {
        favoriteItemLabel.text = cell
        closeButton.tag = itemIndex
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        delegate?.didSelectItemCloseButton(tag: sender.tag)
    }

}
