//
//  CouponGetModel.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

struct CouponGetModel: Codable {
    let success: Bool?
    let meta: CouponMeta
}

struct CouponMeta: Codable {
    let trainingFee: Int?
    let gst: Int?
    let discountedFee: Int?
    let total: Int?
}
