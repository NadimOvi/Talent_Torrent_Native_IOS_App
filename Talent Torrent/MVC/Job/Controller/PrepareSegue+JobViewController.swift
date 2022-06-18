//
//  PrepareSegue+JobViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 25/03/1400 AP.
//  Copyright © 1400 AP TELEAUS. All rights reserved.
//

import UIKit

extension JobViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "JobDetails" {
            let sendData = segue.destination as! JobDetailsVC
            sendData.storeDetailsInfo.append(storeModelData[myIndex!])
            
        }
    }
}
