//
//  JobCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 29/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//
import UIKit
import Alamofire

class JobCreateVC: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var typeDropDownIconImageView: UIImageView!
    @IBOutlet weak var typeDropDownButton: UIButton!
    
    @IBOutlet weak var categoryIdTextField: UITextField!
    @IBOutlet weak var categoryDropDownIconImageView: UIImageView!
    @IBOutlet weak var categoryDropDownButton: UIButton!

    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionContainerView: UIView!
    
    @IBOutlet weak var tagsTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var endDateButton: UIButton!
    
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var datePickerContainerView: UIView!

    
    @IBOutlet weak var typeDropDownListContainerView: UIView!
    @IBOutlet weak var dropdownItemButton1: UIButton!
    @IBOutlet weak var dropdownItemButton2: UIButton!
    @IBOutlet weak var dropdownItemButton3: UIButton!
    @IBOutlet weak var dropdownItemButton4: UIButton!
    
    @IBOutlet weak var categoryDropDownListContainerView: UIView!
    @IBOutlet weak var dropdownItemButton11: UIButton!
    @IBOutlet weak var dropdownItemButton22: UIButton!
    @IBOutlet weak var dropdownItemButton33: UIButton!
    @IBOutlet weak var dropdownItemButton44: UIButton!
    @IBOutlet weak var dropdownItemButton55: UIButton!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    var storeFavoriteSubCatagory: [String] = []
    var dropdownButtonItemIndex = 1
    var trailingURL = "job/create"
    var headers: HTTPHeaders = HTTPHeaders()
    var apiRequest = APIRequest()
    
    var jobProjectType: String?
    var jobCatagoryId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userId: String = defaults.string(forKey: "userID") ?? ""
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        tagCollectionContainerView.isHidden = true
        activityIndicator.isHidden = true
        typeDropDownListContainerView.isHidden = true
        categoryDropDownListContainerView.isHidden = true
        datePickerContainerView.isHidden = true
        
        tagCollectionView.register(JobCreateSkillCollectionViewCell.nib(), forCellWithReuseIdentifier: JobCreateSkillCollectionViewCell.identifire)

        tagCollectionView.dataSource = self
        tagCollectionView.delegate = self
        
        apiRequest.delegate = self
    }
    
    @IBAction func createJobButtonAction(_ sender: UIButton) {
            errorMessageLabel.text = ""
        
        guard let title = titleTextField.text,
              let type = jobProjectType,
              let categoryId = jobCatagoryId,
              !storeFavoriteSubCatagory.isEmpty,
              let endDate = endDateTextField.text,
              let budget = budgetTextField.text,
              let description = descriptionTextView.text
        else { return }
        
        let tags = storeFavoriteSubCatagory
        
        let parameters: Parameters = [ "title": title, "type": type, "category_id": categoryId, "tags": tags, "end_date": endDate, "description": description, "budget":  budget ]
        print(parameters)
        
        apiRequest.getPostToAPIRequest(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers)
    }
    
    @IBAction func saveToDraftButtonAction(_ sender: UIButton) {
            errorMessageLabel.text = ""
        
        guard let title = titleTextField.text,
              let type = jobProjectType,
              let categoryId = jobCatagoryId,
              !storeFavoriteSubCatagory.isEmpty,
              let endDate = endDateTextField.text,
              let budget = budgetTextField.text,
              let description = descriptionTextView.text
        else { return }
        
        let tags = storeFavoriteSubCatagory
        
        let parameters: Parameters = [ "title": title, "type": type, "category_id": categoryId, "tags": tags, "end_date": endDate, "description": description, "budget":  budget, "post_type": "drafted" ]
        
        print(parameters)
        
        apiRequest.getPostToAPIRequest(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers)
    }
    
    
    
    @IBAction func datePickerButtonAction(_ sender: UIButton) {
        if datePickerContainerView.isHidden {
            datePickerContainerView.isHidden = false
            tapGestureRecognizer.isEnabled = false
        } else {
            print("enter here")
            tapGestureRecognizer.isEnabled = true
            datePickerContainerView.isHidden = true
        }
        view.endEditing(true)
    }
    
    @IBAction func datePickerValueChangeAction(_ sender: UIDatePicker) {
        datePickerContainerView.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY/dd"
        endDateTextField.text = dateFormatter.string(from: sender.date)
        datePickerContainerView.isHidden = true
    }
    
    @IBAction func dropDownButtonAction(_ sender: UIButton) {
        if typeDropDownListContainerView.isHidden == false {
            typeDropDownListContainerView.isHidden = true
            typeDropDownIconImageView.transform = typeDropDownIconImageView.transform.rotated(by: .pi)
            
        } else {
            typeDropDownListContainerView.isHidden = false
            typeDropDownIconImageView.transform = typeDropDownIconImageView.transform.rotated(by: .pi)
        }
        view.endEditing(true)
    }
    @IBAction func dropDownItemButtonAction(_ sender: UIButton) {
        if sender.tag == 0 {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton4.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobProjectType = "project"
            
        } else if sender.tag == 1 {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton4.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            
            jobProjectType = "hour"
            
        } else if sender.tag == 2 {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton4.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobProjectType = "week"
            
        } else {
            dropdownItemButton1.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton2.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton3.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton4.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            jobProjectType = "month"
        }
        typeTextField.text = sender.currentTitle
        typeDropDownListContainerView.isHidden = true
        typeDropDownIconImageView.transform = typeDropDownIconImageView.transform.rotated(by: .pi)
        dropdownButtonItemIndex = sender.tag
    }
    
    @IBAction func dropDownButtonAction2(_ sender: UIButton) {
        if categoryDropDownListContainerView.isHidden == false {
            categoryDropDownListContainerView.isHidden = true
            categoryDropDownIconImageView.transform = categoryDropDownIconImageView.transform.rotated(by: .pi)
            
        } else {
            categoryDropDownListContainerView.isHidden = false
            categoryDropDownIconImageView.transform = categoryDropDownIconImageView.transform.rotated(by: .pi)
        }
        view.endEditing(true)
    }
    @IBAction func dropDownItemButtonAction2(_ sender: UIButton) {
        if sender.tag == 0 {
            dropdownItemButton11.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton22.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton33.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton44.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton55.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobCatagoryId = "1"
            
        } else if sender.tag == 1 {
            dropdownItemButton11.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton22.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton33.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton44.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton55.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobCatagoryId = "2"
            
        } else if sender.tag == 2 {
            dropdownItemButton11.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton22.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton33.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton44.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton55.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobCatagoryId = "3"
            
        } else if sender.tag == 3 {
            dropdownItemButton11.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton22.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton33.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton44.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            dropdownItemButton55.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            jobCatagoryId = "4"
            
        } else {
            dropdownItemButton11.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton22.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton33.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton44.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
            dropdownItemButton55.titleLabel?.font = UIFont.systemFont(ofSize: 12.0, weight: .bold)
            jobCatagoryId = "5"
            
        }
        categoryIdTextField.text = sender.currentTitle
        categoryDropDownListContainerView.isHidden = true
        categoryDropDownIconImageView.transform = categoryDropDownIconImageView.transform.rotated(by: .pi)
        dropdownButtonItemIndex = sender.tag
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        datePickerContainerView.isHidden = true
    }
    
}
