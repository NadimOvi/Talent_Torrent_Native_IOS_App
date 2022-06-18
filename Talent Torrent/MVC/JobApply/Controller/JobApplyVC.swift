//
//  JobApplyVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class JobApplyVC: UIViewController {
    
    var storeDetailsInfo: [JobGetModel] = []
    
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorMessageLabel: UILabel!

    var trailing_url = "job/apply/"
    
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        errorMessageLabel.isHidden = true
        apiRequest.delegate = self
        
//        budgetTextField.text = storeDetailsInfo[0].jobBudget
//        descriptionTextView.text = storeDetailsInfo[0].jobDescription
    }
    
    @IBAction func applyButtonAction(_ sender: UIButton) {
        
            errorMessageLabel.text = ""
        guard let budget = budgetTextField.text,
              let message = descriptionTextView.text
        else { return }
        
        let intBudget = Int(budget) ?? 500
        
//        FIXME:- set uuid last part of url
        let trailingURL = "\(trailing_url)\(storeDetailsInfo[0].jobUUID)"
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let parameters: Parameters = [ "budget":  intBudget, "message": message ]
        
        apiRequest.getPostToAPIRequest(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers)
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
