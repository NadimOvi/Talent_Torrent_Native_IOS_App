//
//  API+JobApplyVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension JobApplyVC: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        if json["success"] == true {
            self.performSegue(withIdentifier: "Main", sender: self)
        } else {
            errorMessageLabel.text = "Job not Applied"
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
            print (token[index])
            errorMessageLabel.text = token[index]
        }
    }
}

