//
//  TextField+RegisterViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 6/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension RegisterViewController: UITextFieldDelegate {
    
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
        if textField.tag == 1 {
            firstNameTextField.resignFirstResponder()
            lastNameTextField.becomeFirstResponder()
        } else if textField.tag == 2 {
            lastNameTextField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        } else if textField.tag == 3 {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField.tag == 4 {
            passwordTextField.resignFirstResponder()
            conformPasswordTextField.becomeFirstResponder()
        } else if textField.tag == 5 {
            conformPasswordTextField.resignFirstResponder()
            dropDownButtonAction(dropDownButton)
            
        } else {
            textField.resignFirstResponder()
            registerButtonAction(registerButton)
        }
        return true
    }
}
