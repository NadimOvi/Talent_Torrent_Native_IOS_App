//
//  API+JobAppliedUserVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 4/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension JobAppliedUserVC: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        storeModelData = []
        print("see expert who are applied")
        print(json)
        
        print("see expert who are applied end")

        let jobAppliedUserLogicModel = JobAppliedUserLogicModel()
        storeModelData = jobAppliedUserLogicModel.setDataContainer(json: json)
        
        print("check if set or not \(storeModelData)")
        
        collectionView.reloadData()
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
    }
    
    
}

