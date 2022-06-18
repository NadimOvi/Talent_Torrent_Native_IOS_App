//
//  API+JobAppliedUserDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 7/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension JobAppliedUserDetailsVC: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        if json["success"] == true {
            self.performSegue(withIdentifier: "Main", sender: self)
        } 
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
    }
    
    
}
