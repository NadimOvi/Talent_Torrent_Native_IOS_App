//
//  LoginViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/5/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyePasswordImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    typealias ModelName = LoginGetModel
    var getModelType = LoginGetModel.self
    var trailing_url = "login"
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        apiRequest.delegate = self
        navigationBar()
    }
//    MARK:- IBAction
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
//        FIXME:- Add constant & value
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        
        let parameters: Parameters = [ "login" : email, "password" : password ]
        
        
        
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: nil)
        view.endEditing(true)
    }
    

    
    @IBAction func eyePasswordButtonAction(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            eyePasswordImage.image = #imageLiteral(resourceName: "eye_open")
            passwordTextField.isSecureTextEntry = false
        } else {
            eyePasswordImage.image = #imageLiteral(resourceName: "eye_closed")
            passwordTextField.isSecureTextEntry = true
        }
    }
    

    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}

