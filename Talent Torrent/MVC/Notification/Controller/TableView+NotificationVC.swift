//
//  TableView+NotificationVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension NotificationVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationHeaderTableViewCell.identifire) as! NotificationHeaderTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeModelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NotificationTableViewCell.identifire, for: indexPath) as! NotificationTableViewCell
    
        cell.setCellProperty(storeModelData[indexPath.row])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        trailingURL = "messages/\(storeModelData[indexPath.row].id)/read"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: nil, headers: headers) { json, error in
            self.viewWillAppear(true)
        }
//        performSegue(withIdentifier: "NotificationDetails", sender: self)
    }
    
    
}
