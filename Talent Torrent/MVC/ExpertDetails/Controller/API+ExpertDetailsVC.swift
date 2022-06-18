//
//  API+ExpertDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 4/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension ExpertDetailsVC: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        
        if trailing_url == "connection/status/\(storeDetailsInfo[0].expertId)" {
            print(json["data"]["status"])
            if json["data"]["status"] == "active"{
                connectionButtonContainerView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                connectionButtonLabel.text = "Connected"
                connectionButtonPlusView.isHidden = true
                connectionButton.isEnabled = false
                
            } else if json["data"]["status"] == "pending" {
                
                connectionButtonContainerView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                connectionButtonLabel.text = "Pending"
                connectionButtonPlusView.isHidden = true
                connectionButton.isEnabled = false
                
            } else if json["data"]["status"] == "block" {
                
                connectionButtonContainerView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                connectionButtonLabel.text = "Blocked"
                connectionButtonPlusView.isHidden = true
                connectionButton.isEnabled = false
            }

        } else if trailing_url == "connection/request/\(storeDetailsInfo[0].expertId)" {
            print("connection requewst")
            trailing_url = "connection/status/\(storeDetailsInfo[0].expertId)"
            let userId: String = defaults.string(forKey: "userID") ?? ""
            let headers: HTTPHeaders = [
                "Authorization" : "Bearer \(userId)",
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
            apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: nil, headers: headers)
        }
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)

//        activityIndicator.stopAnimating()
//        activityIndicator.isHidden = true

        let delimiter = ": "
        let token = errorMessage.components(separatedBy: delimiter)
        let index = 1
        if index >= 0 && index < token.count {
            print (token[index])
//            errorMessageLabel.text = token[index]
        }
    }
}


