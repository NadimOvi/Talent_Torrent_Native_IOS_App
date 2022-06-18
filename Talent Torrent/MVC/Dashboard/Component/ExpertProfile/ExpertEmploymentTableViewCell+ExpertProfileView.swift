//
//  ExpertEmploymentTableViewCell+ExpertProfileView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 31/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension ExpertProfileView: ExpertEmploymentTableViewCellProtocol {

    
    func editButtonNotify(buttonTag: Int) {
    }
    
    func deleteButtonNotify(buttonTag: Int) {
        
        trailingURL = "profile/employment/delete/\(buttonTag)"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: nil, headers: headers) { json, error in
            if json != nil {
                self.awakeFromNib()
            } else {
                print(error ?? "")
            }
            
        }
        
        

        
    }
}
