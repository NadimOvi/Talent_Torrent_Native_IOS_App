//
//  StatisticsLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct StatisticsLogicModel {
    typealias ModelName = StatisticsGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
            let item = json["data"]
            let job_posted = item["job_posted"].stringValue
            let job_completed = item["job_completed"].stringValue
            let expert_connected = item["expert_connected"].stringValue
            let business_connected = item["business_connected"].stringValue
            let training_completed = item["training_completed"].stringValue


            
            let getModel = ModelName(businessConnected: job_posted, expertsConnected: job_completed, trainingCompleted: expert_connected, jobsPosted: business_connected, JobsCompleted: training_completed)
            
            data.append(getModel)
        
        return data
    }
}
