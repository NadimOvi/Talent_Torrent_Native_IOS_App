//
//  NewPasswordViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class NewPasswordViewController: UIViewController {

    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var tokenTextField: UITextField!
    
    @IBOutlet weak var setpasswordButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    var holdEmail = ""
    
    var trailing_url = "reset/password"
    var apiRequest = APIRequest()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = holdEmail

        activityIndicator.isHidden = true
        apiRequest.delegate = self
        navigationBar()
    }
    
    
    @IBAction func setpasswordButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
 
////        FIXME:- Add constant & value
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let password_confirmation = conformPasswordTextField.text,
              let token = tokenTextField.text
        else { return }

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
//        FIXME:- Changing parameter & value

//                let register = RegisterPostModel(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation, type: type)
        
        let parameters: Parameters = [ "email": email, "password": password, "password_confirmation": password_confirmation, "token": token ]
        
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: nil)
        view.endEditing(true)
    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}
