//
//  TextField+ClientCreateJobView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension ClientCreateJobView: UITextFieldDelegate {
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
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
