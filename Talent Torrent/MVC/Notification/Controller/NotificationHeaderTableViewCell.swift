//
//  NotificationHeaderTableViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

class NotificationHeaderTableViewCell: UITableViewCell {

    static let identifire = "NotificationHeaderTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NotificationHeaderTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
