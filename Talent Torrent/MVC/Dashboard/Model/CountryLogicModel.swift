//
//  CountryLogicModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

struct CountryLogicModel {
    typealias ModelName = CountryGetModel
    
    func setDataContainer(json: JSON) ->  [ModelName] {
        
        var data: [ModelName] = []
        
        for item in json["data"].arrayValue {
            
            let countryName = item["name"].stringValue
            let countryShortName = item["short_name"].stringValue
            let countryCities = item["cities"].arrayValue.map { $0.stringValue}
            let getModel = ModelName(countryName: countryName, countryShortName: countryShortName, countryCities: countryCities)
            
            data.append(getModel)
        }
        return data
    }
}
