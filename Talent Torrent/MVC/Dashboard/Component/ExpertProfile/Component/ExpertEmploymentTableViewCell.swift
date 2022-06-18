//
//  ExpertEmploymentTableViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

protocol ExpertEmploymentTableViewCellProtocol {
    func editButtonNotify(buttonTag: Int)
    func deleteButtonNotify(buttonTag: Int)
}

class ExpertEmploymentTableViewCell: UITableViewCell {
    
    var delegate: ExpertEmploymentTableViewCellProtocol?
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var workTypeLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var buttonTag: Int? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCellProperty(_ data: EmploymentGetModel) {

        print("============+++++++++")
        print(data.startDate)
        print(data.endDate)
        jobTitleLabel.text = data.jobTitle
        companyNameLabel.text = data.companyName
        workTypeLabel.text = data.workType
        startDateLabel.text = data.startDate
        endDateLabel.text = data.endDate
        descriptionTextView.attributedText = data.description.htmlToAttributedString
        
        
        buttonTag = data.id
    }
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        
        if let buttonTag = buttonTag {
            print(buttonTag)
            delegate?.editButtonNotify(buttonTag: buttonTag)
        }
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            print(buttonTag)
            delegate?.deleteButtonNotify(buttonTag: buttonTag)
        }
    }
}
