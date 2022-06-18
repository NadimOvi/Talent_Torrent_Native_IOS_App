//
//  Function+NotificationVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation

extension NotificationVC {
    func setUpData() {
        if defaults.string(forKey: "userID") != nil {
            fullViewContainerTableView.isHidden = false
            if let blogData = UserDefaults.standard.data(forKey: "blog"),
                let blog = try? JSONDecoder().decode(ModelName.self, from: blogData) {
                loginInfo.append(blog)
                callNotificationAPI()
            }
        } else {
            fullViewContainerTableView.isHidden = true
            self.performSegue(withIdentifier: "Login", sender: self)
        }
    }
    func callNotificationAPI() {
        self.trailingURL = "messages"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: nil, headers: headers) { json, error in
            if json?["success"] == true {
                print("Got Data")
                self.storeModelData = []
                let notificationLogicModel = NotificationLogicModel()
                self.storeModelData = notificationLogicModel.setDataContainer(json: json!)
                self.tableView.reloadData()
            } else {
                print(error ?? "")
            }
        }
    }
}
