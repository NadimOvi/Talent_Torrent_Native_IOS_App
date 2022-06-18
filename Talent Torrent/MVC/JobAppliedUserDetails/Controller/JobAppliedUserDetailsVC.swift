//
//  JobAppliedUserDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 5/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class JobAppliedUserDetailsVC: UIViewController {
    
    
    var storeJobDetailsInfo: [JobGetModel] = []
    var storeJobAppliedUserDetailsInfo: [JobAppliedUserGetModel] = []
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    @IBOutlet weak var profileSubViewImageView: UIImageView!
    @IBOutlet weak var fullNameSubViewLabel: UILabel!
    @IBOutlet weak var countrySubViewLabel: UILabel!
    @IBOutlet weak var budgetSubViewTextField: UITextField!
    
    @IBOutlet weak var hireSubViewHeightNSLayout: NSLayoutConstraint!
    
    @IBOutlet weak var hireButton: UIButton!
    @IBOutlet weak var rejectButton: UIButton!
    
    var trailing_url = "job/create"
    var apiRequest = APIRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        apiRequest.delegate = self
//        print("storeJobDetailsInfo")
//        print(storeJobDetailsInfo)
//        print("storeJobAppliedUserDetailsInfo")
//        print(storeJobAppliedUserDetailsInfo)

    }
    
    @IBAction func hireButtonAction(_ sender: UIButton) {
        if hireSubViewHeightNSLayout.constant == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.hireSubViewHeightNSLayout.constant = 400
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.hireSubViewHeightNSLayout.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func conformHireButtonAction(_ sender: UIButton) {
        
        
        trailing_url = "client/\(storeJobDetailsInfo[0].jobUUID)/hire/user"
        
        guard let budget = budgetSubViewTextField.text
        else { return }
        let intBudget = Int(budget) ?? 500
        let expertId = storeJobAppliedUserDetailsInfo[0].JobAppliedUserId
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        
        print(trailing_url)
        print(userId)
        print(storeJobDetailsInfo[0].jobUUID)
        print(intBudget)
        print(expertId)
        
        let parameters: Parameters = [ "confirmed_budget":  intBudget, "expert_id": expertId ]
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: headers)
    }
    
    
    @IBAction func rejectButtonAction(_ sender: UIButton) {
        
        trailing_url = "client/\(storeJobDetailsInfo[0].jobUUID)/reject/user"
        
        let expertId = storeJobAppliedUserDetailsInfo[0].JobAppliedUserId
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        
        print(trailing_url)
        print(userId)
        print(storeJobDetailsInfo[0].jobUUID)
        print(expertId)
        
        let parameters: Parameters = [ "expert_id": expertId ]
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: headers)
        
        
    }
}
