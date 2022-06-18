//
//  PrepareSegue+JobDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 4/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobDetailsVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobApply" {
            let sendData = segue.destination as! JobApplyVC
            sendData.storeDetailsInfo.append(storeDetailsInfo[0])
        } else if segue.identifier == "JobAppliedUser" {
            let sendData = segue.destination as! JobAppliedUserVC
            sendData.storeDetailsInfo.append(storeDetailsInfo[0])
        } else if segue.identifier == "JobUpdate" {
            let sendData = segue.destination as! JobUpdateVC
            sendData.storeDetailsInfo.append(storeDetailsInfo[0])
        }
    }
}
