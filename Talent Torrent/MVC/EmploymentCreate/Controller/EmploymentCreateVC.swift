//
//  EmploymentCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire


class EmploymentCreateVC: UIViewController {

    
    @IBOutlet weak var jobTitleTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var workTypeTextfield: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var DetailsTextView: UITextView!
    
    @IBOutlet weak var datePickerContainerView: UIView!
    @IBOutlet weak var dropDownListContainerView: UIView!
    @IBOutlet weak var dropDownIconImageView: UIImageView!
    @IBOutlet weak var dropDownTableView: UITableView!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    var trailingURL = ""
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    let workTypeList = ["Full-time", "Part-time", "Freelance", "Contact", "Internship", "Self-employed"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBAction func dropDownButtonAction(_ sender: UIButton) {
        if dropDownListContainerView.isHidden == false {
            dropDownListContainerView.isHidden = true
            dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
            
        } else {
            dropDownListContainerView.isHidden = false
            dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
        }
    }

    
    @IBAction func datePickerButtonAction(_ sender: UIButton) {
        datePickerContainerView.isHidden = false
        view.endEditing(true)
    }
    
    @IBAction func datePickerValueChangeAction(_ sender: UIDatePicker) {
        datePickerContainerView.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        startDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func CreateEmploymentButtonAction(_ sender: UIButton) {

        guard let company_name = companyNameTextField.text,
              let job_title = jobTitleTextField.text,
              let location = locationTextField.text,
              let start_date = startDateTextField.text,
              let work_type = workTypeTextfield.text,
              let description = DetailsTextView.text
        else {return}



        trailingURL = "profile/employment/create"
        let parameters: Parameters = [ "company_name" : company_name, "job_title" : job_title, "location" : location, "start_date" : start_date, "work_type" : work_type, "description" : description ]
        print(parameters)
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in

            if json != nil {
                print("Employment update successfully")
            } else {
                print(error ?? "error occur")
            }

        }
    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        keyboardDisappearFirst(view: view)
    }
}
