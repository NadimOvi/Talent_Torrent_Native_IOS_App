//
//  PrepareSegue+JobAppliedUserVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 5/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobAppliedUserVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobAppliedUserDetails" {
            let sendData = segue.destination as! JobAppliedUserDetailsVC
            
            sendData.storeJobDetailsInfo.append(storeDetailsInfo[0])
            sendData.storeJobAppliedUserDetailsInfo.append(storeModelData[myIndex!])
        }
    }
}
