//
//  PayTrainningPostModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 25/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

struct PayTrainningPostModel: Encodable {
    let date: String
    let paymentMethod: String
    let payment_method: String
    let participant: String
    let address: String
    let phone: String
    let suburb: String
    let state: String
    let postcode: String
    let coupon: String?
}

