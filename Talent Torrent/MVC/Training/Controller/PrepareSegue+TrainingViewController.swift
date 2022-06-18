//
//  PrepareSegue+TrainingViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 25/03/1400 AP.
//  Copyright © 1400 AP TELEAUS. All rights reserved.
//

import UIKit

extension TrainingViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TrainingDetails" {
            let sendData = segue.destination as! TrainingDetailsViewController
            sendData.storeDetailsInfo.append(storeModelData[myIndex!])
        }
    }
}
