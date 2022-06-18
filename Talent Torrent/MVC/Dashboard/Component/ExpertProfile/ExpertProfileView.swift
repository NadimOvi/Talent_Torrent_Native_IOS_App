//
//  ExpertProfileView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 8/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

protocol ExpertProfileDelegate {
    func setExpertUIImage(imagepicker: UIImagePickerController)
    func addEducation()
    func addEmployment()
}

@IBDesignable class ExpertProfileView: UIView {
    
    
    let identifire = "ExpertProfileView"
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var expertcoverImageView: UIImageView!
    @IBOutlet weak var expertprofileImageView: UIImageView!
    
    @IBOutlet weak var expertuserNameTextField: UITextField!
    @IBOutlet weak var expertuserNameEditButton: UIButton!
    
    @IBOutlet weak var expertfirstNameTextField: UITextField!
    @IBOutlet weak var expertlastNameTextField: UITextField!
    @IBOutlet weak var expertemailAddressTextField: UITextField!
    @IBOutlet weak var expertphoneNumberTextField: UITextField!
    @IBOutlet weak var expertcountryTextField: UITextField!
    @IBOutlet weak var expertlocationTextField: UITextField!
    
    
    @IBOutlet weak var expertCountryTableViewContainerView: UIView!
    @IBOutlet weak var expertCountryTableView: UITableView!
    
    @IBOutlet weak var expertQualificationTextField: UITextField!
    @IBOutlet weak var expertExperienceTypeTextField: UITextField!
    @IBOutlet weak var expertBusinessnumberTextField: UITextField!
    @IBOutlet weak var expertSkillCollectionView: UICollectionView!
    @IBOutlet weak var expertCoverLetterTextField: UITextView!
    
    @IBOutlet weak var expertEducationTableView: UITableView!
    @IBOutlet weak var expertEmploymentTableView: UITableView!
    
    
    let profileImagePickerController = UIImagePickerController()
    let coverImagePickerController = UIImagePickerController()
    
    
    var storeCountryData: [CountryGetModel] = []
    var storeEducatioData: [EducationGetModel] = []
    var storeEmploymentData: [EmploymentGetModel] = []
    var demoarry = ["one", "Two", "Theree"]
    var trailingURL = ""
    var delegate: ExpertProfileDelegate?
    
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    var countryShortName: String? = "bd"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        expertuserNameTextField.delegate = self
        expertfirstNameTextField.delegate = self
        expertlastNameTextField.delegate = self
        expertemailAddressTextField.delegate = self
        expertphoneNumberTextField.delegate = self
        expertcountryTextField.delegate = self
        expertlocationTextField.delegate = self
        
        expertQualificationTextField.delegate = self
        expertExperienceTypeTextField.delegate = self
        expertBusinessnumberTextField.delegate = self
        expertCoverLetterTextField.delegate = self
    
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        expertCountryTableViewContainerView.isHidden = true
        
        let nib = UINib(nibName: "ProfileCountryTableViewCell", bundle: nil)
        expertCountryTableView.register(nib, forCellReuseIdentifier: "ProfileCountryTableViewCell")
        
        expertCountryTableView.dataSource = self
        expertCountryTableView.delegate = self
        
        let nib2 = UINib(nibName: "ExpertEducationTableViewCell", bundle: nil)
        expertEducationTableView.register(nib2, forCellReuseIdentifier: "ExpertEducationTableViewCell")
        expertEducationTableView.delegate = self
        expertEducationTableView.dataSource = self
        
        let nib3 = UINib(nibName: "ExpertEmploymentTableViewCell", bundle: nil)
        expertEmploymentTableView.register(nib3, forCellReuseIdentifier: "ExpertEmploymentTableViewCell")
        expertEmploymentTableView.delegate = self
        expertEmploymentTableView.dataSource = self
        
        
        trailingURL = "countries"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers) { json, error in
            self.storeCountryData = []
            let countryLogicModel = CountryLogicModel()
            self.storeCountryData = countryLogicModel.setDataContainer(json: json ?? "")
            self.expertCountryTableView.reloadData()
        }
        trailingURL = "profile/education/histories"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers) { json, error in
            self.storeEducatioData = []
            let educationGetModel = EducationLogicModel()
            self.storeEducatioData = educationGetModel.setDataContainer(json: json ?? "")

            self.expertEducationTableView.reloadData()
        }
        
        trailingURL = "profile/employment/histories"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers) { json, error in
            self.storeEmploymentData = []
            let employmentLogicModel = EmploymentLogicModel()
            
            self.storeEmploymentData = employmentLogicModel.setDataContainer(json: json ?? "")
            
            print("self.storeEmploymentData")
            print(self.storeEmploymentData)
            self.expertEmploymentTableView.reloadData()
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        view = loadViewFromNib(nibName: identifire)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        addSubview(view)
        
    }
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    func configureProfileImage(data: LoginGetModel) {
        
    }
    
    func configureView(data: LoginGetModel) {
        
        let coverURL = URL(string: data.coverPhotoUrl)
        let profileURL = URL(string: data.avatarUrl)
        
        expertcoverImageView.kf.setImage(with: coverURL)
        expertprofileImageView.kf.setImage(with: profileURL)
        expertfirstNameTextField.text = data.firstName
        expertlastNameTextField.text = data.lastName
        expertlocationTextField.text = data.location
        expertcountryTextField.text = data.country
        expertemailAddressTextField.text = data.email
        expertphoneNumberTextField.text = data.phone
        expertuserNameTextField.text = data.username
        
        expertQualificationTextField.text = data.qualification
        expertExperienceTypeTextField.text = data.experience
        expertBusinessnumberTextField.text = data.companyRegistrationNumber
        expertCoverLetterTextField.attributedText = data.coverLetter.htmlToAttributedString
        
    }
    
    // MARK:- Button Action
    
    @IBAction func profileImageEditButton(_ sender: UIButton) {
        profileImagePickerController.sourceType = .photoLibrary
        profileImagePickerController.allowsEditing = true
        profileImagePickerController.delegate = self
        delegate?.setExpertUIImage(imagepicker: profileImagePickerController)
    }

    @IBAction func coverImageEditButtonAction(_ sender: UIButton) {
        coverImagePickerController.sourceType = .photoLibrary
        coverImagePickerController.allowsEditing = true
        coverImagePickerController.delegate = self
        delegate?.setExpertUIImage(imagepicker: coverImagePickerController)
    }
    
    @IBAction func userNameEditButtonAction(_ sender: UIButton) {
        if sender.tag == 1 {
            expertuserNameTextField.backgroundColor = .white
            expertuserNameTextField.isUserInteractionEnabled = true
            expertuserNameTextField.becomeFirstResponder()
            let btnImage = #imageLiteral(resourceName: "update")
            expertuserNameEditButton.setImage(btnImage , for: .normal)
            expertuserNameEditButton.tag = 2
            print("enter here")
        } else {

            print("enter here again")

            guard let username = expertuserNameTextField.text else {return}
            let parameters: Parameters = [ "username" : username ]

            trailingURL = "update/username"
            apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
                print("user name changed successfully")
            }
            expertuserNameTextField.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9254901961, blue: 0.937254902, alpha: 1)
            expertuserNameTextField.isUserInteractionEnabled = false
            expertuserNameTextField.resignFirstResponder()
            let btnImage = #imageLiteral(resourceName: "edit")
            expertuserNameEditButton.setImage(btnImage , for: .normal)
            expertuserNameEditButton.tag = 1

        }

    }
    @IBAction func showCountryListButtonAction(_ sender: UIButton) {
        print("Click me")
        if expertCountryTableViewContainerView.isHidden {
            expertCountryTableViewContainerView.isHidden = false
        } else {
            expertCountryTableViewContainerView.isHidden = true
        }
    }
    @IBAction func personalInfoUpdateButtonAction(_ sender: UIButton) {
        guard let first_name = expertfirstNameTextField.text,
              let last_name = expertlastNameTextField.text,
              let phone = expertphoneNumberTextField.text,
              let country = countryShortName,
              let location = expertlocationTextField.text
        else {return}

        trailingURL = "update"
        let parameters: Parameters = [ "first_name" : first_name, "last_name" : last_name, "phone" : phone, "country" : country, "location" : location ]
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
            
                print("personal update successfully")
        }

    }

    @IBAction func workExpSkillInfoUpdateButtonAction(_ sender: UIButton) {

    }
    @IBAction func addEducationButtonAction(_ sender: UIButton) {
        delegate?.addEducation()
        
    }
    @IBAction func addEmploymentButtonAction(_ sender: UIButton) {
        delegate?.addEmployment()
    }
    


}

extension ExpertProfileView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == expertEducationTableView {
            return storeEducatioData.count
        } else if tableView == expertEmploymentTableView {
            return storeEmploymentData.count
        } else {
            return storeCountryData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == expertEducationTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpertEducationTableViewCell", for: indexPath) as! ExpertEducationTableViewCell
            cell.delegate = self
            cell.setCellProperty(storeEducatioData[indexPath.row])
            return cell
        } else if tableView == expertEmploymentTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpertEmploymentTableViewCell", for: indexPath) as! ExpertEmploymentTableViewCell
            cell.delegate = self
            cell.setCellProperty(storeEmploymentData[indexPath.row])
            return cell
        }  else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCountryTableViewCell", for: indexPath) as! ProfileCountryTableViewCell
            cell.countryLabel.text = storeCountryData[indexPath.row].countryName
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == expertEducationTableView {
            return
        } else if tableView == expertEmploymentTableView {
            return
        } else {
            expertcountryTextField.text = storeCountryData[indexPath.row].countryName
            countryShortName = storeCountryData[indexPath.row].countryShortName
            expertCountryTableViewContainerView.isHidden = true
        }
        
    }
    
}

