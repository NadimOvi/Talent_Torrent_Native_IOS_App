//
//  ResendVerifyCodeViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class ResendVerifyCodeViewController: UIViewController {

    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    var trailing_url = "resend/email"
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = defaults.string(forKey: "registerEmail") ?? ""
        activityIndicator.isHidden = true
        apiRequest.delegate = self
        navigationBar()

    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func resendButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
////        FIXME:- Add constant & value
        guard let email = emailTextField.text
        else { return }

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
//        FIXME:- Changing parameter & value
        
        let parameters: Parameters = [ "email" : email ]
                
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: nil)
                view.endEditing(true)
    }
    


}
