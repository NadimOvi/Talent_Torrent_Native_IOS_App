//
//  Function+HomeVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/03/1400 AP.
//  Copyright © 1400 AP TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON

extension HomeVC {

    func setUpData() {
        if defaults.string(forKey: "userID") != nil {
            if let blogData = UserDefaults.standard.data(forKey: "blog"),
                let blog = try? JSONDecoder().decode(ModelName.self, from: blogData) {
                loginInfo.append(blog)
                
                print(":: Access Token :: \(loginInfo[0].accessToken)")
                setDataifLogedIn(data: loginInfo[0])

                if loginInfo[0].type != "client" {
                    jobCreateButton.isHidden = true
                }
            }
        } else {
            jobCreateButton.isHidden = true
            profileImageView.image = #imageLiteral(resourceName: "user_blue")
        }
    }
    private func setDataifLogedIn(data: LoginGetModel) {
        let profileURL = URL(string: data.avatarUrl)
        profileImageView.kf.setImage(with: profileURL)
        
    }

    func setstatistics(jsonData: StatisticsGetModel) {
        
        businessConnectedLabel.text = jsonData.businessConnected
        expertsConnectedLabel.text = jsonData.expertsConnected
        trainingCompletedLabel.text = jsonData.trainingCompleted
        jobsPostedLabel.text = jsonData.jobsPosted
        JobsCompletedLabel.text = jsonData.JobsCompleted
    }
    
    func tabBarDesign() {
        guard let tabBar = self.tabBarController?.tabBar else { return }
        tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2987371575)
    }
    
    func setTopTabButtonAction(collectionView: UICollectionView, button: UIButton, trailingURLPart: String) {
        keyboardDisappearFirst(view: view)
        setPlaceholderText()
        
        jobCollectionView.isHidden = true
        expertCollectionView.isHidden = true
        trainingCollectionView.isHidden = true
        collectionView.isHidden = false
        
        jobButton.setTitleColor(#colorLiteral(red: 0.6178864241, green: 0.6179012656, blue: 0.6178932786, alpha: 1), for: .normal)
        expertButton.setTitleColor(#colorLiteral(red: 0.6178864241, green: 0.6179012656, blue: 0.6178932786, alpha: 1), for: .normal)
        trainingButton.setTitleColor(#colorLiteral(red: 0.6178864241, green: 0.6179012656, blue: 0.6178932786, alpha: 1), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9959512353, green: 0.5249217749, blue: 0.4935360551, alpha: 1), for: .normal)
        
        callAPI(trailingURLPart: trailingURLPart)

    }
    func callAPI(trailingURLPart: String) {
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURLPart, method: .get, parameters: nil, headers: nil) { [self] json, error in
            if json != nil {
                if trailingURL == "jobs" {
                    print("Enter here")
                    guard let json = json else { return }
                    jobStoreModelData = []
                    let jobLogicModel = JobLogicModel()
                    jobStoreModelData = jobLogicModel.setDataContainer(json: json)
                    jobCollectionView.reloadData()
                    guard !jobStoreModelData.isEmpty else { return }
                    tapGestureRecognizer2.isEnabled = false
                    
                } else if trailingURL == "experts" {
                    guard let json = json else { return }
                    expertStoreModelData = []
                    let expertLogicModel = ExpertLogicModel()
                    expertStoreModelData = expertLogicModel.setDataContainer(json: json)
                    expertCollectionView.reloadData()
                    guard !expertStoreModelData.isEmpty else { return }
                    tapGestureRecognizer2.isEnabled = false
                    
                } else if trailingURL == "trainings" {
                    guard let json = json else { return }
                    trainingStoreModelData = []
                    let trainingtLogicModel = TrainingLogicModel()
                    trainingStoreModelData = trainingtLogicModel.setDataContainer(json: json)
                    trainingCollectionView.reloadData()
                    guard !trainingStoreModelData.isEmpty else { return }
                    tapGestureRecognizer2.isEnabled = false
                }
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

    func hideShowCollectionView(buttonTag: Int) {
        jobCollectionView.isHidden = true
        expertCollectionView.isHidden = true
        trainingCollectionView.isHidden = true
        
        switch buttonTag {
        case 1:
            jobCollectionView.isHidden = false
        case 2:
            expertCollectionView.isHidden = false
        case 3:
            trainingCollectionView.isHidden = false
        default:
            return
        }
    }

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
}

