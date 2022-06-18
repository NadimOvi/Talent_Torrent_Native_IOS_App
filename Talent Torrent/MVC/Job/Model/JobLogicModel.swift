//
//  JobLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct JobLogicModel {
    typealias ModelName = JobGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
        for item in json["data"].arrayValue {
            
            let jobID = item["id"].intValue
            let jobType = item["type"].stringValue
            let jobUUID = item["uuid"].stringValue
            let jobTitle = item["title"].stringValue
            let jobBudget = item["budget"].stringValue
            let jobRemainDay = item["end_date"].stringValue
            let jobDateOfPost = item["created_at"].stringValue
            let jobDescription = item["description"].stringValue
            let jobTags = item["tags"].arrayValue.map { $0.stringValue}
            let categoryId = item["category"]["id"].intValue
            let categoryName = item["category"]["name"].stringValue
            


            
                let getModel = ModelName(jobID: jobID, jobType: jobType, jobUUID: jobUUID, jobTitle: jobTitle, jobBudget: jobBudget, jobRemainDay: jobRemainDay, jobDateOfPost: jobDateOfPost, jobDescription: jobDescription, jobtags: jobTags, categoryId: categoryId, categoryName: categoryName)
            
            data.append(getModel)
        }
        return data
    }
}
