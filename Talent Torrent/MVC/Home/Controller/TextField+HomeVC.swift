//
//  TextField+HomeVC.swift
//  Talent Torrent
//
//  Created by MacBook Pro 2015 on 21/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension HomeVC: UITextFieldDelegate {
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