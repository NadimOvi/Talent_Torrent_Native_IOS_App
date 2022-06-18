//
//  TextField+UpdatePasswordVC.swift
//  Talent Torrent
//
//  Created by MacBook Pro 2015 on 21/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension UpdatePasswordVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.borderStyle = .bezel
        setMoreConstant()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.borderStyle = .roundedRect
        setLessConstant()
    }
//    @IBOutlet weak var currentPasswordTextField: UITextField!
//    @IBOutlet weak var CurrentPasswordEyeImageView: UIImageView!
//    @IBOutlet weak var NewPasswordTextField: UITextField!
//    @IBOutlet weak var NewPasswordEyeImageView: UIImageView!
//    @IBOutlet weak var conformPasswordTextField: UITextField!
//    @IBOutlet weak var conformPasswordEyeImageView: UIImageView!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            currentPasswordTextField.resignFirstResponder()
            NewPasswordTextField.becomeFirstResponder()
        } else if textField.tag == 2 {
            NewPasswordTextField.resignFirstResponder()
            conformPasswordTextField.becomeFirstResponder()
        } else if textField.tag == 3 {
            conformPasswordTextField.resignFirstResponder()
            setpasswordButtonAction(updatePasswordButton)
        } else {
            textField.resignFirstResponder()
            setpasswordButtonAction(updatePasswordButton)
        }
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type please..."
            return false
        }
    }
}
