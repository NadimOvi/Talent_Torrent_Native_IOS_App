//
//  ExpertAppliedJob+DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension DashboardVC: ExpertAppliedJobViewDelegate {
    func expertAppliedJobInfo(totalNumber: String) {
        
        expertAppliedJobLabel.text = totalNumber
            }
}
