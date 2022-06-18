//
//  Function+MenuViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 16/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension MenuViewController {
    func storeData() {
        if let blogData = UserDefaults.standard.data(forKey: "blog"),
            let blog = try? JSONDecoder().decode(ModelName.self, from: blogData) {
            loginInfo.append(blog)
            print(blog)
        }
    }
    func setUpData() {
        if defaults.string(forKey: "userID") != nil {
            fullNameLabel.text = "\(loginInfo[0].firstName) \(loginInfo[0].lastName)"
            logInOutButton.setTitle("Log Out", for: .normal)
            profileButton.isHidden = false
            updatePasswordButton.isHidden = false
        } else {
            profileButton.isHidden = true
            updatePasswordButton.isHidden = true
        }
        
    }
}
