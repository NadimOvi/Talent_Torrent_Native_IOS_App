//
//  EmploymentLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct EmploymentLogicModel {
    typealias ModelName = EmploymentGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
     
        
        var data: [ModelName] = []
                
        
        for array in json["data"].arrayValue {
            for item in array.arrayValue {
                let id = item["id"].intValue
                let user_id = item["user_id"].intValue
                let company_name = item["company_name"].stringValue
                let job_title = item["job_title"].stringValue
                let location = item["location"].stringValue
                let start_date = item["start_date"].stringValue
                let end_date = item["end_date"].stringValue
                let current = item["current"].boolValue
                let work_type = item["work_type"].stringValue
                let description = item["description"].stringValue
                
                
                let getModel = ModelName(id: id, userId: user_id, companyName: company_name, jobTitle: job_title, location: location, startDate: start_date, endDate: end_date, current: current, workType: work_type, description: description)
                
                data.append(getModel)
            }

        }
        return data
    }
}
