//
//  ExpertProfile+DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 9/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension DashboardVC: ExpertProfileDelegate {

    
    func setExpertUIImage(imagepicker: UIImagePickerController) {

        present(imagepicker, animated: true, completion: nil)
 
        
    }
    func addEducation() {
        print("add education")
        performSegue(withIdentifier: "EducationCreate", sender: self)
    }
    
    func addEmployment() {
        print("add employment")
        performSegue(withIdentifier: "EmploymentCreate", sender: self)
    }
    
}
