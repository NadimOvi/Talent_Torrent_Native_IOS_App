//
//  Function+JobUpdateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobUpdateVC {
    func setMoreConstant() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { (notification) in
            if notification.name == UIResponder.keyboardDidShowNotification {
                if let userInfo = notification.userInfo,
                   let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                   
                    self.scrollViewBottom.constant = keyboardRectangle.height - 50
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    func setLessConstant() {
        self.scrollViewBottom.constant = 0
        self.view.layoutIfNeeded()
    }
    func setUIPreUpdate() {
        titleTextField.text = storeDetailsInfo[0].jobTitle
        endDateTextField.text = storeDetailsInfo[0].jobRemainDay
        
        typeTextField.text = storeDetailsInfo[0].jobType
        jobProjectType = storeDetailsInfo[0].jobType
        
        categoryIdTextField.text = storeDetailsInfo[0].categoryName
        jobCatagoryId = String(storeDetailsInfo[0].categoryId)
        
        storeFavoriteSubCatagory = storeDetailsInfo[0].jobtags
        
        
        let budgetWithcurence = storeDetailsInfo[0].jobBudget
        let delimiter = "$"
        let token = budgetWithcurence.components(separatedBy: delimiter)
        let index = 1
        if index >= 0 && index < token.count {
            budgetTextField.text = token[index]
        }
        
        descriptionTextView.text = storeDetailsInfo[0].jobDescription
        

    }
}
