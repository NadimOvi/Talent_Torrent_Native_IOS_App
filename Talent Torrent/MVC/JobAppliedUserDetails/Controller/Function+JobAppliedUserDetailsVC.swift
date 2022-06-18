//
//  Function+JobAppliedUserDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 7/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobAppliedUserDetailsVC {
    func updateUI() {
        let profileURL = URL(string: storeJobAppliedUserDetailsInfo[0].expertProfileImageURL)
        profileImageView.kf.setImage(with: profileURL)
        fullNameLabel.text = "\(storeJobAppliedUserDetailsInfo[0].expartFirstName) \(storeJobAppliedUserDetailsInfo[0].expertLastName)"
        countryLabel.text = storeJobAppliedUserDetailsInfo[0].expertCountry
        budgetLabel.text = "Proposed Budget: $\(storeJobAppliedUserDetailsInfo[0].JobAppliedUserBudget)"
        messageLabel.text = storeJobAppliedUserDetailsInfo[0].JobAppliedUserMessage
        
        profileSubViewImageView.kf.setImage(with: profileURL)
        fullNameSubViewLabel.text = "\(storeJobAppliedUserDetailsInfo[0].expartFirstName) \(storeJobAppliedUserDetailsInfo[0].expertLastName)"
        countrySubViewLabel.text = storeJobAppliedUserDetailsInfo[0].expertCountry

    }
}
