//
//  API+ConnectionVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 2/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension ConnectionVC: APIRequestDataSource {
    
    func containDataFromAPI(json: JSON) {
        
        printLabel.text = json.stringValue
    }
    

    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
        
               
    }
    
    
}

