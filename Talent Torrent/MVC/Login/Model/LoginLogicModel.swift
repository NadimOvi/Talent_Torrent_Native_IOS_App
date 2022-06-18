//
//  LoginLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct LoginLogicModel {
    typealias ModelName = LoginGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {

        
        var data: [ModelName] = []
            
            let id = json["data"]["id"].intValue
            let accessToken = json["access_token"].stringValue
            let firstName = json["data"]["first_name"].stringValue
            let lastName = json["data"]["last_name"].stringValue
            let email = json["data"]["email"].stringValue
            let username = json["data"]["username"].stringValue
            let type = json["data"]["type"].stringValue
            let isPublic = json["data"]["profile"]["is_public"].intValue
            let avatarUrl = json["data"]["profile"]["avatar_url"].stringValue
            let coverPhotoUrl = json["data"]["profile"]["cover_photo_url"].stringValue
            let dateOfBirth = json["data"]["profile"]["date_of_birth"].stringValue
            let phone = json["data"]["profile"]["phone"].stringValue
            let qualification = json["data"]["profile"]["qualification"].stringValue
            let experience = json["data"]["profile"]["experience"].stringValue
            let skills = json["data"]["profile"]["skills"].arrayValue.map { $0.stringValue}
            let businessNumber = json["data"]["profile"]["business_number"].stringValue
            let coverLetter = json["data"]["profile"]["cover_letter"].stringValue
            let companyName = json["data"]["profile"]["company_name"].stringValue
            let companySize = json["data"]["profile"]["company_size"].stringValue
            let businessType = json["data"]["profile"]["business_type"].stringValue
            let companyRegistrationNumber = json["data"]["profile"]["company_registration_number"].stringValue
            let location = json["data"]["profile"]["location"].stringValue
            let country = json["data"]["profile"]["country"].stringValue

            
        let getModel = ModelName(id: id, accessToken: accessToken, firstName: firstName, lastName: lastName, email: email, username: username, type: type, isPublic: isPublic, avatarUrl: avatarUrl, coverPhotoUrl: coverPhotoUrl, dateOfBirth: dateOfBirth, phone: phone, qualification: qualification, experience: experience, skills: skills, businessNumber: businessNumber, coverLetter: coverLetter, companyName: companyName, companySize: companySize, businessType: businessType, companyRegistrationNumber: companyRegistrationNumber, location: location, country: country)
            
            data.append(getModel)
        return data
    }
}
