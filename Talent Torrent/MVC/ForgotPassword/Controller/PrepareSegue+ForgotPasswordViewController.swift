//
//  PrepareSegue+ForgotPasswordViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 17/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//
import UIKit

extension ForgotPasswordViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewPassword" {
            let sendData = segue.destination as! NewPasswordViewController
            sendData.holdEmail = emailTextField.text ?? ""
        }
    }
}
