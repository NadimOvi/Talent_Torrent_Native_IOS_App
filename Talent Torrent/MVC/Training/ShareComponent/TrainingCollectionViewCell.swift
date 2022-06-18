//
//  TrainingCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

import UIKit
protocol YourCellDelegate : AnyObject {
    func didPressButton(_ indexPath: IndexPath)
}

class TrainingCollectionViewCell: UICollectionViewCell {
    
    var cellDelegate: YourCellDelegate? 
    
    var indexPath: IndexPath = []
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    
    static let identifire = "TrainingCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TrainingCollectionViewCell", bundle: nil)
    }
    
    
    func setCellProperty(_ data: TrainingGetModel, indexPath: IndexPath) {
        self.indexPath = indexPath
        titleLabel.text = data.trainingTitle
        locationLabel.text = data.trainingLocation
        durationLabel.text = data.trainingDuration
        dateLabel.text = data.trainingCreatedAt
        feeLabel.text = String(data.trainingFee)
    }
    
    @IBAction func detailsButtonAction(_ sender: UIButton) {
        cellDelegate?.didPressButton(indexPath)
        print(cellDelegate ?? "empty")
        print("click me")
    }
}
