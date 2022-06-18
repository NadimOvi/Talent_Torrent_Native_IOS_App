//
//  Fucntion+JobViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 1/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobViewController {


    func callAPI(trailingURLPart: String) {
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURLPart, method: .get, parameters: nil, headers: nil) { [self] json, error in
            if json != nil {
                print("Enter here")
                guard let json = json else { return }
                storeModelData = []
                let jobLogicModel = JobLogicModel()
                storeModelData = jobLogicModel.setDataContainer(json: json)
                collectionView.reloadData()
                guard !storeModelData.isEmpty else { return }
                tapGestureRecognizer3.isEnabled = false
                
                
            } else {
                
                searchTextField.placeholder = "Find nothing"
            }
                   
        }
    }
    
    func setPlaceholderText() {
        if trailingURL == "jobs" {
            searchTextField.placeholder = "Search job"
        } else if trailingURL == "experts" {
            searchTextField.placeholder = "Search Expert"
            
        } else if trailingURL == "trainings" {
            searchTextField.placeholder = "Search Training"
        }
    }
    func setMoreConstant() {
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: nil) { (notification) in
            
            if notification.name == UIResponder.keyboardDidShowNotification {
                
                if let userInfo = notification.userInfo,
                   let keyboardRectangle = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                   
                    self.stackViewBottom.constant = keyboardRectangle.height - 50
                    self.view.layoutIfNeeded()
                }
            }
        }

    }
    func setLessConstant() {
        self.stackViewBottom.constant = 0
        self.view.layoutIfNeeded()
  
    }
}


