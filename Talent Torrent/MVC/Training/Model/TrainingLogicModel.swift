//
//  TrainingLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct TrainingLogicModel {
    typealias ModelName = TrainingGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
        for item in json["data"].arrayValue {
            
            let trainingId = item["id"].stringValue
            let trainingTitle = item["title"].stringValue
            let trainingDetails = item["details"].stringValue
            let trainingFee = item["fee"].intValue
            let trainingDuration = item["duration"].stringValue
            let trainingStartDate = item["start_date"].stringValue
            let trainingLocation = item["location"].stringValue
            let trainingCreatedAt = item["created_at"].stringValue
            let trainingUpdatedAt = item["updated_at"].stringValue

            
            let getModel = ModelName(trainingId: trainingId, trainingTitle: trainingTitle, trainingDetails: trainingDetails, trainingFee: trainingFee, trainingDuration: trainingDuration, trainingStartDate: trainingStartDate, trainingLocation: trainingLocation, trainingCreatedAt: trainingCreatedAt, trainingUpdatedAt: trainingUpdatedAt)
            
            data.append(getModel)
        }
        return data
    }
}
