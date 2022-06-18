//
//  JobAppliedUserLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 5/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct JobAppliedUserLogicModel {
    
    typealias ModelName = JobAppliedUserGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        let dispatchGroup = DispatchGroup()
        
        var data: [ModelName] = []
        let countDataItem = json["data"].count
        
        for i in 0..<countDataItem {
            dispatchGroup.enter()
            
            let JobAppliedId = json["data"][i]["id"].intValue
            let JobAppliedUserStatus = json["data"][i]["status"].stringValue
            let JobAppliedUserBudget  = json["data"][i]["budget"].stringValue
            let JobAppliedUserId = json["data"][i]["user_id"].intValue
            let JobAppliedUserMessage = json["data"][i]["message"].stringValue
            
            let expertProfileImageURL = json["data"][i]["user"]["profile"]["avatar_url"].stringValue
            let expertCoverImageURL = json["data"][i]["user"]["profile"]["cover_photo_url"].stringValue
            let expartFirstName = json["data"][i]["user"]["first_name"].stringValue
            let expertLastName = json["data"][i]["user"]["last_name"].stringValue
            let expertCountry = json["data"][i]["user"]["profile"]["country"].stringValue
            let expertCoverLetter = json["data"][i]["user"]["profile"]["cover_letter"].stringValue
            let expertSkill = json["data"][i]["user"]["profile"]["skills"].arrayValue.map { $0.stringValue}
            
            let getModel = ModelName(JobAppliedId: JobAppliedId, JobAppliedUserStatus: JobAppliedUserStatus, JobAppliedUserBudget: JobAppliedUserBudget, JobAppliedUserId: JobAppliedUserId, JobAppliedUserMessage: JobAppliedUserMessage, expertProfileImageURL: expertProfileImageURL, expertCoverImageURL: expertCoverImageURL, expartFirstName: expartFirstName, expertLastName: expertLastName, expertCountry: expertCountry, expertCoverLetter: expertCoverLetter, expertSkill: expertSkill)
            
            data.append(getModel)
        }
       
        print("logic print 2 \(data)")
        return data
    }
}

