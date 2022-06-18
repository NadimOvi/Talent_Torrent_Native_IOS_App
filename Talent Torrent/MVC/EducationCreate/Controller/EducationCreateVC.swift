//
//  EducationCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 11/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class EducationCreateVC: UIViewController {
    
    @IBOutlet weak var instituteTextField: UITextField!
    @IBOutlet weak var degreeTextField: UITextField!
    @IBOutlet weak var fieldStudyTextField: UITextField!
    @IBOutlet weak var startYearTextfield: UITextField!
    @IBOutlet weak var endExpectedYearTextField: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var detailsTextView: UITextView!
    @IBOutlet weak var activitiesTextView: UITextView!
    
    @IBOutlet weak var datePickerContainerView1: UIView!
    @IBOutlet weak var datePickerContainerView2: UIView!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    
    var trailingURL = ""
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        // Do any additional setup after loading the view.
    }
    @IBAction func datePickerButtonAction1(_ sender: UIButton) {
        datePickerContainerView1.isHidden = false
        view.endEditing(true)
    }
    
    @IBAction func datePickerValueChangeAction1(_ sender: UIDatePicker) {
        datePickerContainerView1.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        startYearTextfield.text = dateFormatter.string(from: sender.date)
    }
    @IBAction func datePickerButtonAction2(_ sender: UIButton) {
        datePickerContainerView2.isHidden = false
        view.endEditing(true)
    }
    
    @IBAction func datePickerValueChangeAction2(_ sender: UIDatePicker) {
        datePickerContainerView2.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        endExpectedYearTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func createEducationButtonAction(_ sender: UIButton) {
        
        guard let institute = instituteTextField.text,
            let degree = degreeTextField.text,
            let field_of_study = fieldStudyTextField.text,
            let start_year = startYearTextfield.text,
            let end_year = endExpectedYearTextField.text,
            let grade = gradeTextField.text,
            let activities = activitiesTextView.text,
            let description = detailsTextView.text
        else {return}
        
        trailingURL = "profile/education/create"
        let parameters: Parameters = [ "institute" : institute, "degree" : degree, "field_of_study" : field_of_study, "start_year" : start_year, "end_year" : end_year, "grade" : grade, "activities": activities, "description": description ]
        print(parameters)
        
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
            
            if json != nil {
                print("Education create successfully")
                
            } else {
                print(error ?? "error occur")
            }
        }
    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        keyboardDisappearFirst(view: view)
    }
}
