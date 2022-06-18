//
//  ClientActiveJob+DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension DashboardVC: ClientActiveJobDelegate {
    func activeJobInfo(totalNumber: String) {
        
        countActiveJobLabel.text = totalNumber
    }
}
