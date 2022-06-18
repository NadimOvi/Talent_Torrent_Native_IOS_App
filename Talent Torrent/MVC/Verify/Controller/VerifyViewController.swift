//
//  VerifyViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class VerifyViewController: UIViewController {
    
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var verifyCodeTextField: UITextField!
    
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    var trailing_url = "verify/email"
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        apiRequest.delegate = self
        navigationBar()
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func verifyButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
////        FIXME:- Add constant & value
        guard let token = verifyCodeTextField.text
        else { return }

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
//        FIXME:- Changing parameter & value
            
        let parameters: Parameters = [ "token": token ]
        
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: nil)
       
        view.endEditing(true)
    }
    
}
