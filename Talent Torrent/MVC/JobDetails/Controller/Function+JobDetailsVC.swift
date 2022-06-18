//
//  Function+JobDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 4/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobDetailsVC {
    
    func hideButtonContainer() {
        jobApplyButtonContainer.isHidden = true
        appliedUsersButtonContainer.isHidden = true
        jobUpdateButtonContainer.isHidden = true
    }
    func setUpData() {
        if defaults.string(forKey: "userID") != nil {
            
            if let blogData = UserDefaults.standard.data(forKey: "blog"),
               let blog = try? JSONDecoder().decode(ModelName.self, from: blogData) {
                loginInfo.append(blog)
                
                if loginInfo[0].type == "expert" {
                    jobApplyButtonContainer.isHidden = false
                    
                } else if loginInfo[0].type == "client" {
                    if let clientJobs = UserDefaults.standard.data(forKey: "storeClientJob"),
                       let jobs = try? JSONDecoder().decode([JobGetModel].self, from: clientJobs) {
                        for item in jobs {
                            if item.jobID == storeDetailsInfo[0].jobID {
                                appliedUsersButtonContainer.isHidden = false
                                jobUpdateButtonContainer.isHidden = false
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}
