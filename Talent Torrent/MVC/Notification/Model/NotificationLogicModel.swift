//
//  NotificationLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct NotificationLogicModel {
    typealias ModelName = NotificationGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
        for item in json["data"].arrayValue {
            
            let id = item["id"].intValue
            let message = item["message"].stringValue
            let status = item["status"].stringValue
            let url = item["url"].stringValue
            let created_at = item["created_at"].stringValue
            
            let getModel = ModelName(id: id, message: message, status: status, url: url, createdAt: created_at)
            
            data.append(getModel)
        }
        return data
    }
}
