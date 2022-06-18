//
//  JobAppliedUserCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 5/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

class JobAppliedUserCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var skill: [String?] = []
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //    FIXME:- Change Parameter Datatye & set variable
    func setCellProperty(_ data: JobAppliedUserGetModel) {
        
        let profileURL = URL(string: data.expertProfileImageURL)
        
        profileImageView.kf.setImage(with: profileURL)
        firstNameLabel.text = data.expartFirstName
        lastNameLabel.text = data.expertLastName
        countryLabel.text = data.expertCountry
        budgetLabel.text = "Proposed Budget: $\(data.JobAppliedUserBudget)"
        messageLabel.text = data.JobAppliedUserMessage
        
        skill.append(">>")
        skill.append(contentsOf: data.expertSkill)

    }
    
}

