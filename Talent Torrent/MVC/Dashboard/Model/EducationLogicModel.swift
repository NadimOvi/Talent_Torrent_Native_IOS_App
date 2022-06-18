//
//  EducationLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct EducationLogicModel {
    typealias ModelName = EducationGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
    
        
        var data: [ModelName] = []
                
        
        for array in json["data"].arrayValue {
            
            for item in array.arrayValue {
                let id = item["id"].intValue
                let user_id = item["user_id"].intValue
                let institute = item["institute"].stringValue
                let degree = item["degree"].stringValue
                let field_of_study = item["field_of_study"].stringValue
                let start_year = item["start_year"].stringValue
                let end_year = item["end_year"].stringValue
                let grade = item["grade"].stringValue
                let activities = item["activities"].stringValue
                let description = item["description"].stringValue
                
                
                let getModel = ModelName(id: id, userId: user_id, institute: institute, degree: degree, fieldOfStudy: field_of_study, startYear: start_year, endYear: end_year, grade: grade, activities: activities, description: description)
                
                data.append(getModel)
            }
            

        }
        return data
    }
}
