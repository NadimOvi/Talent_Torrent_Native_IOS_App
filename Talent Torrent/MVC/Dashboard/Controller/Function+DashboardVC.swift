//
//  Function+DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 3/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

extension DashboardVC {
    // FIXME: clientBodysetHiddenComponent will be same as ecpertBodyContainerHide
    
    func temporyHideButtonOutlet() {
        clientTransactionButton.isHidden = true
        clientPaymentInformationButton.isHidden = true
        clientInviteFriendButton.isHidden = true
        
        expertTransactionButton.isHidden = true
        expertPaymentInformationButton.isHidden = true
        expertInviteFriendButton.isHidden = true
    }
    
    func clientBodyContainerHide(_ containerView: UIView) {
        if containerView == clientProfileContainerView {
            navigationController?.setNavigationBarHidden(true, animated: false)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
        clientProfileContainerView.isHidden = true
        clientCreateJobContainerView.isHidden = true
        clientConnectionContainerView.isHidden = true
        clientActiveJobContainerView.isHidden = true
        clientDraftedJobContainerView.isHidden = true
        clientAwardedJobContainerView.isHidden = true
        clientOngoingJobContainerView.isHidden = true
        clientSubmittedJobContainerView.isHidden = true
        clientCompletedJobContainerView.isHidden = true
        clientChangePasswordContainerVie.isHidden = true
        containerView.isHidden = false
    }
    func ecpertBodyContainerHide(_ containerView: UIView) {
        if containerView == expertProfileContainerView {
            navigationController?.setNavigationBarHidden(true, animated: false)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: false)
        }
        expertProfileContainerView.isHidden = true
        expertConnectionContainerView.isHidden = true
        expertAppliedJobContainerView.isHidden = true
        expertAwardedJobContainerView.isHidden = true
        expertOngoingJobContainerView.isHidden = true
        expertSubmittedJobContainerView.isHidden = true
        expertCompletedJobContainerView.isHidden = true
        expertChangePasswordContainerView.isHidden = true
        containerView.isHidden = false
    }
    func setUpData() {
        
        if defaults.string(forKey: "userID") != nil {
            fullViewContainerStackView.isHidden = false
            if let blogData = UserDefaults.standard.data(forKey: "blog"),
                let blog = try? JSONDecoder().decode(ModelName.self, from: blogData) {
                loginInfo.append(blog)
                
                if loginInfo[0].type == "client" {
                    expertMenuScrollView.isHidden = true
                    expertBodyContainerView.isHidden = true
                    clientBodyContainerHide(clientProfileContainerView)
                    clientProfileContainerView.configureView(data: loginInfo[0])
                } else if loginInfo[0].type == "expert" {
                    
                    clientMenuScrollView.isHidden = true
                    clientBodyContainerView.isHidden = true
                    
                    ecpertBodyContainerHide(expertProfileContainerView)
                    expertProfileContainerView.configureView(data: loginInfo[0])
                    
                    
                }
            }
        } else {
            fullViewContainerStackView.isHidden = true
            self.performSegue(withIdentifier: "Login", sender: self)
        }
    }
//    private func clientProfileSetData(data: LoginGetModel) {
////        let coverURL = URL(string: loginInfo[0].coverPhotoUrl)
////        let profileURL = URL(string: loginInfo[0].avatarUrl)
////
////        coverImageView.kf.setImage(with: coverURL)
////        profileImageView.kf.setImage(with: profileURL)
////        firstNameTextField.text = data.firstName
////        lastNameTextField.text = data.lastName
////        locationTextField.text = data.location
////        countryTextField.text = data.country
////        companyNameTextField.text = data.companyName
////        businessTypeTextField.text = data.businessType
////        registerNumberTextField.text = data.companyRegistrationNumber
////        companySizeTextField.text = data.companySize
////        phoneNumberTextField.text = data.phone
////        emailAddressTextField.text = data.email
////        userNameTextField.text = data.username
//    }
    
}
