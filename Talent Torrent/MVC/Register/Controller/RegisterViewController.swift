//
//  Register_ViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/5/21.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var conformPasswordTextField: UITextField!
    @IBOutlet weak var userTypeTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
//    errorMessageLabel.text = ""
    
    @IBOutlet weak var dropDownIconImageView: UIImageView!
    @IBOutlet weak var dropDownListContainerView: ViewIBDesignable!
    
    
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropdownItemButton1: UIButton!
    @IBOutlet weak var dropdownItemButton2: UIButton!
    @IBOutlet weak var dropdownItemButton3: UIButton!
    
    var dropdownButtonItemIndex = 1
    
    
    
    
    var trailing_url = "registration"
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropDownListContainerView.isHidden = true
        activityIndicator.isHidden = true
        apiRequest.delegate = self
        navigationBar()
    }
    
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        errorMessageLabel.text = ""
////        FIXME:- Add constant & value
        guard let first_name = firstNameTextField.text,
              let last_name = lastNameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let password_confirmation = conformPasswordTextField.text
        else { return }
        
        var userType = ""
        if dropdownButtonItemIndex == 0 {
            userType = "client"
        } else if dropdownButtonItemIndex == 1 {
            userType = "expert"
        } else {
            userType = "user"
        }

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
//        FIXME:- Changing parameter & value
        
        //    let first_name: String
        //    let last_name: String
        //    let email: String
        //    let password: String
        //    let password_confirmation: String
        //    let type: String
        
        let parameters: Parameters = [ "first_name" : first_name, "last_name" : last_name, "email" : email, "password" : password, "password_confirmation" : password_confirmation, "type": userType ]

        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: parameters, headers: nil)

        view.endEditing(true)
    }
    
    @IBAction func dropDownButtonAction(_ sender: UIButton) {
        if dropDownListContainerView.isHidden == false {
            dropDownListContainerView.isHidden = true
//            dropDownButton.setImage(#imageLiteral(resourceName: "bottom_arrow"), for: .normal)
            dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
            
        } else {
            dropDownListContainerView.isHidden = false
//            dropDownButton.setImage(#imageLiteral(resourceName: "UpArrow"), for: .normal)
            dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
        }
    }
    @IBAction func dropDownItemButtonAction(_ sender: UIButton) {
        if sender.tag == 0 {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            
        } else if sender.tag == 1 {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            
        } else {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            
        }
        userTypeTextField.text = sender.currentTitle
        dropDownListContainerView.isHidden = true
        dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
        dropdownButtonItemIndex = sender.tag
    }
    
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        dropDownListContainerView.isHidden = true
//        dropDownButton.setImage(#imageLiteral(resourceName: "top_arrow"), for: .normal)
        dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
    }
    
}
