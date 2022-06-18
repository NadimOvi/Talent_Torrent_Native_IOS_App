//
//  PrepareSegue+TrainingDetailsViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension TrainingDetailsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrainingApply" {
            let sendData = segue.destination as! TrainingApplyViewController
            sendData.storeDetailsInfo.append(storeDetailsInfo[0])
//            sendData.titleString = titleString
//            sendData.location = location
//            sendData.duration = duration
//            sendData.date = date
//            sendData.fee = fee
//            sendData.trainingId = trainingId
        }
    }
}
