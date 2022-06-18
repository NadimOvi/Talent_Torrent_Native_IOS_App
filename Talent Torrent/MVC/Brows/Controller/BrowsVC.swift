//
//  BrowsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/5/21.
//

import UIKit

class BrowsVC: UIViewController {
    @IBOutlet weak var jobCreateButton: UIButton!
    
    @IBOutlet weak var jobButton: UIButton!
    @IBOutlet weak var expertButton: UIButton!
    @IBOutlet weak var trainingButton: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonImage: UIImageView!
    
    @IBOutlet weak var jobCollectionView: UICollectionView!
    @IBOutlet weak var expertCollectionView: UICollectionView!
    @IBOutlet weak var trainingCollectionView: UICollectionView!
    
    
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var tapGestureRecognizer2: UITapGestureRecognizer!
    
    typealias ModelName = LoginGetModel
    
    var myIndex: Int?
    var loginInfo: [LoginGetModel] = []
    var apiRequest = APIRequest()
    
    
    typealias JobCollectionViewCellName = JobCollectionViewCell
    typealias ExpertCollectionViewCellName = ExpertCollectionViewCell
    typealias TrainingCollectionViewCellName = TrainingCollectionViewCell
    
    var jobStoreModelData: [JobGetModel] = []
    var expertStoreModelData: [ExpertGetModel] = []
    var trainingStoreModelData: [TrainingGetModel] = []
    
    var trailingURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarDesign()
        setUpData()
        

        
        jobCollectionView.register(JobCollectionViewCell.nib(), forCellWithReuseIdentifier: JobCollectionViewCell.identifire)
        expertCollectionView.register(ExpertCollectionViewCell.nib(), forCellWithReuseIdentifier: ExpertCollectionViewCell.identifire)
        trainingCollectionView.register(TrainingCollectionViewCellName.nib(), forCellWithReuseIdentifier: TrainingCollectionViewCellName.identifire)
        
        apiRequest.delegate = self
        jobCollectionView.dataSource = self
        jobCollectionView.delegate = self
        expertCollectionView.dataSource = self
        expertCollectionView.delegate = self
        trainingCollectionView.dataSource = self
        trainingCollectionView.delegate = self
        
        
        if browsTabButtonIndex == 0 {
            jobButtonAction(jobButton)
        } else if browsTabButtonIndex == 1 {
            expertButtonAction(expertButton)
        } else if browsTabButtonIndex == 2 {
            trainingButtonAction(trainingButton)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func jobButtonAction(_ sender: UIButton) {
        trailingURL = "jobs"
        setTopTabButtonAction(collectionView: jobCollectionView, button: jobButton, trailingURLPart: trailingURL)
    }

    
    @IBAction func expertButtonAction(_ sender: UIButton) {
        trailingURL = "experts"
        setTopTabButtonAction(collectionView: expertCollectionView, button: expertButton, trailingURLPart: trailingURL)
    }
    
    @IBAction func trainingButtonAction(_ sender: UIButton) {
        trailingURL = "trainings"
        setTopTabButtonAction(collectionView: trainingCollectionView, button: trainingButton, trailingURLPart: trailingURL)

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
