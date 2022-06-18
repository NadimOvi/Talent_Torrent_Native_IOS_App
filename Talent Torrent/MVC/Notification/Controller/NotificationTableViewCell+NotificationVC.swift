//
//  NotificationTableViewCell+NotificationVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension NotificationVC: NotificationTableViewCellDelegate {
    func cellArchiveButtonAction(notificationId: Int) {
        print("Notification id is \(notificationId)")
        trailingURL = "messages/\(notificationId)/archived"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: nil, headers: headers) { json, error in
            if json?["success"] == true {
                self.viewWillAppear(true)
            } else {
                print("error")
            }
        }
        
    }
    
    
}
