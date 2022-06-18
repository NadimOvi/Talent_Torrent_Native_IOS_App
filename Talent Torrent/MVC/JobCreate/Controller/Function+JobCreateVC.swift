//
//  Function+JobCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobCreateVC {
    func setMoreConstant() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { (notification) in
            if notification.name == UIResponder.keyboardDidShowNotification {
                if let userInfo = notification.userInfo,
                   let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                   
                    self.scrollViewBottom.constant = keyboardRectangle.height - 50
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    func setLessConstant() {
        self.scrollViewBottom.constant = 0
        self.view.layoutIfNeeded()
    }
}
