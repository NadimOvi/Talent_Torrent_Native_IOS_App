//
//  UpdatePasswordVC.swift
//  Talent Torrent
//
//  Created by MacBook Pro 2015 on 21/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class UpdatePasswordVC: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var CurrentPasswordEyeImageView: UIImageView!
    @IBOutlet weak var NewPasswordTextField: UITextField!
    @IBOutlet weak var NewPasswordEyeImageView: UIImageView!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var conformPasswordEyeImageView: UIImageView!
    
    
    @IBOutlet weak var updatePasswordButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!

    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    var trailingUrl = "update/password"
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageLabel.text = ""
        activityIndicator.isHidden = true
        
        let userId: String = defaults.string(forKey: "userID") ?? ""

        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }

    @IBAction func setpasswordButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
 
        
        guard let old_password = currentPasswordTextField.text,
              let password = NewPasswordTextField.text,
              let password_confirmation = conformPasswordTextField.text
        else { return }

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        
        let parameters: Parameters = [ "old_password": old_password, "password": password, "password_confirmation": password_confirmation ]
        
        apiRequest.sendAPIRequestBackData(trailingURL: trailingUrl, method: .post, parameters: parameters, headers: headers) { json, error in
            if json != nil {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.errorMessageLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                self.errorMessageLabel.text = json!["data"].stringValue
                let timer: Double = 2.0
                DispatchQueue.main.asyncAfter(deadline: .now() + timer) {
                    self.dismiss(animated: true, completion: nil)
                }
                
            } else {

                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                
                let delimiter = ": "
                let token = error!.components(separatedBy: delimiter)
                let index = 1
                if index >= 0 && index < token.count {
                    print (token[index])
                    self.errorMessageLabel.text = token[index]
                }
            }
        }
        view.endEditing(true)
    }
    
    @IBAction func eyePasswordButtonAction1(_ sender: UIButton) {
        if currentPasswordTextField.isSecureTextEntry {
            CurrentPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_open")
            currentPasswordTextField.isSecureTextEntry = false
        } else {
            CurrentPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_closed")
            currentPasswordTextField.isSecureTextEntry = true
        }
    }
    @IBAction func eyePasswordButtonAction2(_ sender: UIButton) {
        if NewPasswordTextField.isSecureTextEntry {
            NewPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_open")
            NewPasswordTextField.isSecureTextEntry = false
        } else {
            NewPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_closed")
            NewPasswordTextField.isSecureTextEntry = true
        }
    }
    @IBAction func eyePasswordButtonAction3(_ sender: UIButton) {
        if conformPasswordTextField.isSecureTextEntry {
            conformPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_open")
            conformPasswordTextField.isSecureTextEntry = false
        } else {
            conformPasswordEyeImageView.image = #imageLiteral(resourceName: "eye_closed")
            conformPasswordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
