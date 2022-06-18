//
//  ExpertLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ExpertLogicModel {
    
    typealias ModelName = ExpertGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
        for item in json["data"].arrayValue {
            
            let expertId = item["id"].intValue
            let expertProfileImageURL = item["profile"]["avatar_url"].stringValue
            let expertCoverImageURL = item["profile"]["cover_photo_url"].stringValue
            let expartFirstName = item["first_name"].stringValue
            let expertLastName = item["last_name"].stringValue
            let expertCountry = item["profile"]["country"].stringValue
            let expertCoverLetter = item["profile"]["cover_letter"].stringValue
            let expertSkill = item["profile"]["skills"].arrayValue.map { $0.stringValue}
                        
            let getModel = ModelName(expertId: expertId, expertProfileImageURL: expertProfileImageURL, expertCoverImageURL: expertCoverImageURL,  expartFirstName: expartFirstName, expertLastName: expertLastName, expertCountry: expertCountry, expertCoverLetter: expertCoverLetter, expertSkill: expertSkill)
            
            data.append(getModel)
        }
        return data
    }
}
