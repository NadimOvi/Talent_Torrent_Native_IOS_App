//
//  JobAppliedUserVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class JobAppliedUserVC: UIViewController {

    var storeDetailsInfo: [JobGetModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var storeModelData: [JobAppliedUserGetModel] = []
    var apiRequest = APIRequest()
    
    var myIndex: Int?
    
    
    var trailingURL = ""
    typealias CollectionViewCellName = JobAppliedUserCollectionViewCell
    var cellIdentity = "JobAppliedUserCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        apiRequest.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        trailingURL = "client/\(storeDetailsInfo[0].jobUUID)/applied/users"
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        apiRequest.getPostToAPIRequest(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers)
        

    }
    
}
