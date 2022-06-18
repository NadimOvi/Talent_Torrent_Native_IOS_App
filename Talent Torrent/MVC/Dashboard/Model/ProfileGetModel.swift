//
//  ProfileGetModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 3/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation

struct ProfileGetModel: Codable {
    let id: Int
    let accessToken: String
    let firstName: String
    let lastName: String
    let email: String
    let username: String
    let type: String
    let isPublic: Int
    let avatarUrl: String
    let coverPhotoUrl: String
    let dateOfBirth: String
    let phone: String
    let qualification: String
    let experience: String
    let skills: [String]
    let businessNumber: String
    let coverLetter: String
    let companyName: String
    let companySize: String
    let businessType: String
    let companyRegistrationNumber: String
    let location: String
    let country: String
}
