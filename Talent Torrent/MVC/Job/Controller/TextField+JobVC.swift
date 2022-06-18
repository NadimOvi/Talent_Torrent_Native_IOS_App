//
//  TextField+JobVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 31/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.borderStyle = .bezel
        setMoreConstant()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.borderStyle = .roundedRect
        setLessConstant()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchButtonAction(searchButton)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
