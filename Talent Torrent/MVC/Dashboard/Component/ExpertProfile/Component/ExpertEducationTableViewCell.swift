//
//  ExpertEducationTableViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

protocol ExpertEducationTableViewCellProtocol {
    func editButtonClickNotify(buttonTag: Int)
    func deleteButtonClickNotify(buttonTag: Int)
}

class ExpertEducationTableViewCell: UITableViewCell {
    
    var delegate: ExpertEducationTableViewCellProtocol?
    
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var instituteLabel: UILabel!
    @IBOutlet weak var startYearLabel: UILabel!
    @IBOutlet weak var endYearLabel: UILabel!
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
    
    func setCellProperty(_ data: EducationGetModel) {
        
        print("==========")
        print(data.description)
        degreeLabel.text = data.degree
        instituteLabel.text = data.institute
        startYearLabel.text = data.startYear
        endYearLabel.text = data.endYear
        descriptionTextView.attributedText = data.description.htmlToAttributedString
        
        buttonTag = data.id
    }
    
    @IBAction func editButtonAction(_ sender: UIButton) {
        
        if let buttonTag = buttonTag {
            print(buttonTag)
            delegate?.editButtonClickNotify(buttonTag: buttonTag)
        }
    }
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        if let buttonTag = buttonTag {
            print(buttonTag)
            delegate?.deleteButtonClickNotify(buttonTag: buttonTag)
        }
    }
        
}
