//
//  Function+NewPasswordViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension NewPasswordViewController {
    func navigationBar() {
        
        let navController = navigationController!

//        navController.navigationBar.frame.size.height = 200
        let image = #imageLiteral(resourceName: "logo") //Your logo url here
        let imageView = UIImageView(image: image)

        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height

        let bannerX = bannerWidth / 2 - (image.size.width) / 2
        let bannerY = bannerHeight / 2 - (image.size.height) / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
    }
    func setMoreConstant() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { (notification) in
            
            if notification.name == UIResponder.keyboardDidShowNotification {
                
                if let userInfo = notification.userInfo,
                   let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                   
                    self.scrollViewBottom.constant = keyboardRectangle.height
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

