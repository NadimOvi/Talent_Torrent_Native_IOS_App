//
//  API+ExpertViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 2/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension ExpertViewController: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        storeModelData = []
        let expertLogicModel = ExpertLogicModel()
        storeModelData = expertLogicModel.setDataContainer(json: json)
        collectionView.reloadData()
        
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
    }
    
    
}


