//
//  API+BrowsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension BrowsVC: APIRequestDataSource {
    func containDataFromAPI(json: JSON) {
        if trailingURL == "jobs" {
            jobStoreModelData = []
            let jobLogicModel = JobLogicModel()
            jobStoreModelData = jobLogicModel.setDataContainer(json: json)
            jobCollectionView.reloadData()
            guard !jobStoreModelData.isEmpty else { return }
            tapGestureRecognizer2.isEnabled = false
            
        } else if trailingURL == "experts" {
            expertStoreModelData = []
            let expertLogicModel = ExpertLogicModel()
            expertStoreModelData = expertLogicModel.setDataContainer(json: json)
            expertCollectionView.reloadData()
            guard !expertStoreModelData.isEmpty else { return }
            tapGestureRecognizer2.isEnabled = false
            
        } else if trailingURL == "trainings" {
            trainingStoreModelData = []
            let trainingtLogicModel = TrainingLogicModel()
            trainingStoreModelData = trainingtLogicModel.setDataContainer(json: json)
            trainingCollectionView.reloadData()
            guard !trainingStoreModelData.isEmpty else { return }
            tapGestureRecognizer2.isEnabled = false
        }
    }
    
    func containErrorFromAPI(errorMessage: String) {
        print(errorMessage)
        searchTextField.placeholder = "Find nothing"
        
    }
}
