//
//  JobGetModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

struct JobGetModel: Codable {
    let jobID: Int
    let jobType: String
    let jobUUID: String
    let jobTitle: String
    let jobBudget: String
    let jobRemainDay: String
    let jobDateOfPost: String
    let jobDescription: String
    let jobtags: [String]
    let categoryId: Int
    let categoryName: String
}
