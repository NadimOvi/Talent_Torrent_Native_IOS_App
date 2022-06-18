//
//  ClientProfileView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 9/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire


protocol ClientProfileDelegate {
    func setClientUIImage(imagepicker: UIImagePickerController)
}


class ClientProfileView: UIView {
        
    let identifire = "ClientProfileView"

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var countryTableViewContainerView: UIView!
    @IBOutlet weak var countryTableView: UITableView!
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userNameEditButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var businessTypeTextField: UITextField!
    @IBOutlet weak var registerNumberTextField: UITextField!
    @IBOutlet weak var companySizeTextField: UITextField!

    
    let profileImagePickerController = UIImagePickerController()
    let coverImagePickerController = UIImagePickerController()

    var storeCountryData: [CountryGetModel] = []
    var demoarry = ["one", "Two", "Theree"]
    var trailingURL = ""
    var delegate: ClientProfileDelegate?

    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    var countryShortName: String? = "bd"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNameTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailAddressTextField.delegate = self
        phoneNumberTextField.delegate = self
        countryTextField.delegate = self
        locationTextField.delegate = self
        companyNameTextField.delegate = self
        businessTypeTextField.delegate = self
        registerNumberTextField.delegate = self
        companySizeTextField.delegate = self

        let userId: String = defaults.string(forKey: "userID") ?? ""

        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        countryTableViewContainerView.isHidden = true

        let nib = UINib(nibName: "ProfileCountryTableViewCell", bundle: nil)
        countryTableView.register(nib, forCellReuseIdentifier: "ProfileCountryTableViewCell")

        countryTableView.dataSource = self
        countryTableView.delegate = self

        trailingURL = "countries"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers) { json, error in
            self.storeCountryData = []
            let countryLogicModel = CountryLogicModel()
            self.storeCountryData = countryLogicModel.setDataContainer(json: json ?? "")
            self.countryTableView.reloadData()
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
    func configureView(data: LoginGetModel) {

        let coverURL = URL(string: data.coverPhotoUrl)
        let profileURL = URL(string: data.avatarUrl)
        coverImageView.kf.setImage(with: coverURL)
        profileImageView.kf.setImage(with: profileURL)
        firstNameTextField.text = data.firstName
        lastNameTextField.text = data.lastName
        locationTextField.text = data.location
        countryTextField.text = data.country
        companyNameTextField.text = data.companyName
        businessTypeTextField.text = data.businessType
        registerNumberTextField.text = data.companyRegistrationNumber
        companySizeTextField.text = data.companySize
        phoneNumberTextField.text = data.phone
        emailAddressTextField.text = data.email
        userNameTextField.text = data.username

    }
    // MARK:- Button Action
    
    @IBAction func profileImageEditButton(_ sender: UIButton) {
        profileImagePickerController.sourceType = .photoLibrary
        profileImagePickerController.allowsEditing = true
        profileImagePickerController.delegate = self
        delegate?.setClientUIImage(imagepicker: profileImagePickerController)
    }

    @IBAction func coverImageEditButtonAction(_ sender: UIButton) {
        coverImagePickerController.sourceType = .photoLibrary
        coverImagePickerController.allowsEditing = true
        coverImagePickerController.delegate = self
        delegate?.setClientUIImage(imagepicker: coverImagePickerController)
    }
    @IBAction func userNameEditButtonAction(_ sender: UIButton) {
        if sender.tag == 1 {
            userNameTextField.backgroundColor = .white
            userNameTextField.isUserInteractionEnabled = true
            userNameTextField.becomeFirstResponder()
            let btnImage = #imageLiteral(resourceName: "update")
            userNameEditButton.setImage(btnImage , for: .normal)
            userNameEditButton.tag = 2
            print("enter here")
        } else {

            print("enter here again")

            guard let username = userNameTextField.text else {return}
            let parameters: Parameters = [ "username" : username ]

            trailingURL = "update/username"
            apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
                print("user name changed successfully")
            }
            userNameTextField.backgroundColor = #colorLiteral(red: 0.9137254902, green: 0.9254901961, blue: 0.937254902, alpha: 1)
            userNameTextField.isUserInteractionEnabled = false
            userNameTextField.resignFirstResponder()
            let btnImage = #imageLiteral(resourceName: "edit")
            userNameEditButton.setImage(btnImage , for: .normal)
            userNameEditButton.tag = 1

        }
    }
    @IBAction func showCountryListButtonAction(_ sender: UIButton) {
        print("Click me")
        if countryTableViewContainerView.isHidden {
            countryTableViewContainerView.isHidden = false
        } else {
            countryTableViewContainerView.isHidden = true
        }
    }
    @IBAction func personalInfoUpdateButtonAction(_ sender: UIButton) {
        guard let first_name = firstNameTextField.text,
              let last_name = lastNameTextField.text,
              let phone = phoneNumberTextField.text,
              let country = countryShortName,
              let location = locationTextField.text
        else {return}

        trailingURL = "update"
        let parameters: Parameters = [ "first_name" : first_name, "last_name" : last_name, "phone" : phone, "country" : country, "location" : location ]
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
            
                print("personal update successfully")
        }
    }
    
    @IBAction func companyInfoUpdateButtonAction(_ sender: UIButton) {

        guard let company_name = companyNameTextField.text,
              let company_registration_number = registerNumberTextField.text,
              let business_type = businessTypeTextField.text,
              let company_size = companySizeTextField.text
        else {return}
        
        trailingURL = "update/company"
        let parameters: Parameters = [ "company_name" : company_name, "company_registration_number" : company_registration_number, "business_type" : business_type, "company_size" : company_size ]
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: headers) { json, error in
            
//            guard json != nil else { return }
            print("company info update successfully")
        }
    }
}
extension ClientProfileView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storeCountryData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCountryTableViewCell", for: indexPath) as! ProfileCountryTableViewCell
        cell.countryLabel.text = storeCountryData[indexPath.row].countryName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryTextField.text = storeCountryData[indexPath.row].countryName
        countryShortName = storeCountryData[indexPath.row].countryShortName
        countryTableViewContainerView.isHidden = true
    }

}
