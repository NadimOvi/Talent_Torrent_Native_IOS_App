//
//  API+RegisterViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension RegisterViewController: APIRequestDataSource {
    
    func containErrorFromAPI(errorMessage: String) {
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        
        let delimiter = ": "
        let token = errorMessage.components(separatedBy: delimiter)
        let index = 1
        if index >= 0 && index < token.count {
            print (token[index])
            errorMessageLabel.text = token[index]
        }
        
        
    }
    
    func containDataFromAPI(json: JSON) {
        
        print("Checkpoint If got success")
        
        setNSUserDefaults(json)


        if json["success"] == true {
            self.performSegue(withIdentifier: "Verify", sender: self)
            errorMessageLabel.text = ""
        } else {
            errorMessageLabel.text = "Try Again"
        }
        
        activityIndicator.stopAnimating()
    }
    private func setNSUserDefaults(_ model: JSON) {
        let registerEmail = model["data"]["email"].stringValue
        defaults.set(registerEmail, forKey: "registerEmail")
    }
    
}
