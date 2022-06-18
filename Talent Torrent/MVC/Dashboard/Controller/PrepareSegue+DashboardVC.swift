//
//  PrepareSegue+DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 4/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension DashboardVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobDetails" {
            let sendData = segue.destination as! JobDetailsVC
            sendData.storeDetailsInfo.append(storeModelData[myIndex!])
            
        }
    }
}
