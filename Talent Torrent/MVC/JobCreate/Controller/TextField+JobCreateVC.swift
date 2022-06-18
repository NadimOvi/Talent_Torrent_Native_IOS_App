//
//  TextField+JobCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//
import UIKit

extension JobCreateVC: UITextFieldDelegate {
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
        
        if textField == titleTextField {
            titleTextField.resignFirstResponder()
        } else if textField == tagsTextField {
            if textField.text != "" {
                storeFavoriteSubCatagory.append(tagsTextField.text!)
                if storeFavoriteSubCatagory.isEmpty {
                    tagCollectionContainerView.isHidden = true
                } else {
                    tagCollectionContainerView.isHidden = false
                }
                self.tagCollectionView.reloadData()
                tagsTextField.text = ""
                return false
            } else {
                tagsTextField.resignFirstResponder()
            }
            
        } else if textField == budgetTextField {
            budgetTextField.resignFirstResponder()
        }
        return true
    }
}
