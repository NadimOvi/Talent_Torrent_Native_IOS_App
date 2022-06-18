//
//  ConnectionVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class ConnectionVC: UIViewController {

    var trailing_url = "connection"
    var apiRequest = APIRequest()
    
    @IBOutlet weak var printLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiRequest.delegate = self
        let userId: String = defaults.string(forKey: "userID") ?? ""
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: nil, headers: headers)

    }

}
