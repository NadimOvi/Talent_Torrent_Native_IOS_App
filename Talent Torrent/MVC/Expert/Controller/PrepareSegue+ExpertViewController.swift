//
//  PrepareSegue+ExpertViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/03/1400 AP.
//  Copyright © 1400 AP TELEAUS. All rights reserved.
//

import UIKit

extension ExpertViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ExpertDetails" {
            let sendData = segue.destination as! ExpertDetailsVC
            sendData.storeDetailsInfo.append(storeModelData[myIndex!])
        }
    }
}
