//
//  PrepareSegue+HomeVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 15/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension HomeVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobDetails" {
            let sendData = segue.destination as! JobDetailsVC
            sendData.storeDetailsInfo.append(jobStoreModelData[myIndex!])
            
        } else if segue.identifier == "ExpertDetails" {
            let sendData = segue.destination as! ExpertDetailsVC
            sendData.storeDetailsInfo.append(expertStoreModelData[myIndex!])
            
        } else if segue.identifier == "TrainingDetails" {
            let sendData = segue.destination as! TrainingDetailsViewController
            sendData.storeDetailsInfo.append(trainingStoreModelData[myIndex!])
            
        } else if segue.identifier == "Menu" {
            
            let sendData = segue.destination as! MenuViewController
            sendData.delegate = self
        }
    }
}

