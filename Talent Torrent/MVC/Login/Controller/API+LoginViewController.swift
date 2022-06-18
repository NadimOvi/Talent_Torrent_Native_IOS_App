//
//  API+LoginViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 3/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

extension LoginViewController: APIRequestDataSource {
    
    func containDataFromAPI(json: JSON) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
        if trailing_url == "login" {
            if json["success"] == true {
                let loginLogicModel = LoginLogicModel()
                let storeModelData = loginLogicModel.setDataContainer(json: json)
                setNSUserDefaults(storeModelData[0])
            
                print("::see access token:: \(defaults.string(forKey: "userID") ?? "")")
                self.performSegue(withIdentifier: "Main", sender: self)
                     
            } else {
                errorMessageLabel.text = "Try Again"
            }
        } else {
            
            var storeModelData: [JobGetModel] = []
            let jobLogicModel = JobLogicModel()
            storeModelData = jobLogicModel.setDataContainer(json: json)
            
            
            if let encoded = try? JSONEncoder().encode(storeModelData) {
                UserDefaults.standard.set(encoded, forKey: "storeClientJob")
            }
        }
            
        }
    
        private func setNSUserDefaults(_ model: ModelName) {
            defaults.set(model.accessToken, forKey: "userID")
    
            if let encoded = try? JSONEncoder().encode(model) {
                defaults.set(encoded, forKey: "blog")
                defaults.synchronize()
            }
            
            if model.type == "client" {
                trailing_url = "client/jobs"
                
                let userId: String = defaults.string(forKey: "userID") ?? ""
                let headers: HTTPHeaders = [
                    "Authorization" : "Bearer \(userId)",
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                ]
                
                apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .get, parameters: nil, headers: headers)
            }
        }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)

        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true

        let delimiter = ": "
        let token = errorMessage.components(separatedBy: delimiter)
        let index = 1
        if index >= 0 && index < token.count {
            errorMessageLabel.text = token[index]
            if token[index] == "400." {
//                performSegue(withIdentifier: "Verify", sender: self)
            }
        }
    }
}
