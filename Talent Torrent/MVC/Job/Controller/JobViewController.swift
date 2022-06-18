//
//  JobViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/5/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class JobViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var jobCreateButton: UIButton!
    
    @IBOutlet weak var stackViewBottom: NSLayoutConstraint!
    @IBOutlet weak var tapGestureRecognizer3: UITapGestureRecognizer!
    
    var myIndex: Int?
    typealias ModelName = LoginGetModel
    var loginInfo: [LoginGetModel] = []
    
    var apiRequest = APIRequest()
    var storeModelData: [JobGetModel] = []
    var trailingURL = "jobs"

    
    
    typealias CollectionViewCellName = JobCollectionViewCell
    var cellIdentity = "JobCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setUpData()
//        NavigationBarDesign()
        
        apiRequest.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
        
        apiRequest.getPostToAPIRequest(trailingURL: trailingURL, method: .get, parameters: nil, headers: nil)
        
    }
    @IBAction func searchButtonAction(_ sender: UIButton) {


        guard let searchTexh = searchTextField.text else { return }
        let searchurl = "\(trailingURL)?search=\(searchTexh)"

        callAPI(trailingURLPart: searchurl)

        keyboardDisappearFirst(view: view)
        searchTextField.text = ""
        setPlaceholderText()
        
    }
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        keyboardDisappearFirst(view: view)
    }
}

