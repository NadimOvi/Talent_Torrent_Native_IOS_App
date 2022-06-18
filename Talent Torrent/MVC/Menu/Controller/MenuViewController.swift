//
//  MenuViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/03/1400 AP.
//  Copyright © 1400 AP TELEAUS. All rights reserved.
//

import UIKit

protocol CanReceive {
    func goSelectedScreen(number: Int, tabButtonNumber: Int?)
    func performLoginScreen()
}

class MenuViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var logInOutButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var updatePasswordButton: UIButton!
    
    let homeVC = HomeVC()
    
    
    typealias ModelName = LoginGetModel
    
    var loginInfo: [LoginGetModel] = []
    
    var delegate: CanReceive?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        storeData()
        setUpData()
        
        
    }
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func homeButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 0, tabButtonNumber: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func browsButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 1, tabButtonNumber: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func dashboardButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 2, tabButtonNumber: nil)
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func notificationButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 3, tabButtonNumber: nil)
        dismiss(animated: true, completion: nil)
       
    }
    
    @IBAction func jobButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 1, tabButtonNumber: 0)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func expertButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 1, tabButtonNumber: 1)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func trainingButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 1, tabButtonNumber: 2)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func profileButtonAction(_ sender: UIButton) {
        delegate?.goSelectedScreen(number: 2, tabButtonNumber: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func UpdatePasswordButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "UpdatePassword", sender: self)
//        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func logOutButtonAction(_ sender: UIButton) {
        defaults.set(nil, forKey: "userID")
        defaults.set(nil, forKey: "blog")
        self.dismiss(animated: true) {
            self.delegate?.performLoginScreen()
        }
    }
    
    // FIXME:- when click only blar part then dismiss
    @IBAction func tapGestureRecognizerAction(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Main" {
            let vc = segue.destination as! MainViewController
            vc.selectedIndex = 1
            
        }
    }
    
}
