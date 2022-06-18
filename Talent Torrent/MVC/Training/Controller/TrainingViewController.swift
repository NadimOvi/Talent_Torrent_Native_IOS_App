//
//  TrainingViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/5/21.
//

import UIKit

class TrainingViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonImage: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var stackViewBottom: NSLayoutConstraint!
    @IBOutlet weak var tapGestureRecognizer2: UITapGestureRecognizer!
    
    var myIndex: Int?
    var apiRequest = APIRequest()
    
    var storeModelData: [TrainingGetModel] = []
    var trailingURL = "trainings"
    
    
    typealias CollectionViewCellName = TrainingCollectionViewCell
    var cellIdentity = "TrainingCollectionViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
