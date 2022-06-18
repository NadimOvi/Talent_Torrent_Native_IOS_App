//
//  NotificationTableViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

protocol NotificationTableViewCellDelegate {
    func cellArchiveButtonAction(notificationId: Int)
}

class NotificationTableViewCell: UITableViewCell {
    
    static let identifire = "NotificationTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "NotificationTableViewCell", bundle: nil)
    }
    var delegate: NotificationTableViewCellDelegate?
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var arciveButton: UIButton!
    
    var notificationId: Int? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCellProperty(_ data: NotificationGetModel) {

        if data.status == "read" {
            messageLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
            arciveButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)
            arciveButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
            
        }
        messageLabel.text = data.message
        notificationId = data.id
    }
    
    
    @IBAction func archiveButtonAction(_ sender: UIButton) {
        print("click me")
        if let notificationId = notificationId {
            delegate?.cellArchiveButtonAction(notificationId: notificationId)
        }
    }
    
}
