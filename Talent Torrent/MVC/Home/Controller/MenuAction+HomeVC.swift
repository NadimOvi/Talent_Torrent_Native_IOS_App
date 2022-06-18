//
//  MenuAction+HomeVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 19/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension HomeVC: CanReceive {
    func goSelectedScreen(number: Int, tabButtonNumber: Int?) {
        if let index = tabButtonNumber {
            browsTabButtonIndex = index
        }
        tabBarController?.selectedIndex = number
    }

    func performLoginScreen() {
       
        performSegue(withIdentifier: "Login", sender: self)
        setUpData()
    }
}
