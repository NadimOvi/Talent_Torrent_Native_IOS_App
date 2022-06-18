//
//  API+JobViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 8/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension JobViewController: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        storeModelData = []
        let jobLogicModel = JobLogicModel()
        storeModelData = jobLogicModel.setDataContainer(json: json)
        collectionView.reloadData()
        
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
    }
    
}
