//
//  TextField+LoginViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 5/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.borderStyle = .bezel
        setMoreConstant()
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
//            textField.placeholder = ""
            return true
        } else {
//            textField.placeholder = "Type Country Short Name"
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
//        you can reset your placeholder again
//        textField.text = ""
        textField.borderStyle = .roundedRect
        setLessConstant()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            loginButtonAction(loginButton)
        }

        return true
    }
}

