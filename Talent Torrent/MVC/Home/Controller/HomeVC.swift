//
//  HomeVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/5/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeVC: UIViewController {

    @IBOutlet weak var profileImageContainerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileImageButton: UIButton!
    
    @IBOutlet weak var jobButton: UIButton!
    @IBOutlet weak var expertButton: UIButton!
    @IBOutlet weak var trainingButton: UIButton!
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchButtonImage: UIImageView!
    
    @IBOutlet weak var businessConnectedLabel: UILabel!
    @IBOutlet weak var expertsConnectedLabel: UILabel!
    @IBOutlet weak var trainingCompletedLabel: UILabel!
    @IBOutlet weak var jobsPostedLabel: UILabel!
    @IBOutlet weak var JobsCompletedLabel: UILabel!
    
    @IBOutlet weak var jobCollectionView: UICollectionView!
    @IBOutlet weak var expertCollectionView: UICollectionView!
    @IBOutlet weak var trainingCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewContainer: UIView!
    @IBOutlet weak var jobCreateButton: UIButton!
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var tapGestureRecognizer2: UITapGestureRecognizer!
    
    
    typealias ModelName = LoginGetModel
    typealias JobCollectionViewCellName = JobCollectionViewCell
    typealias ExpertCollectionViewCellName = ExpertCollectionViewCell
    typealias TrainingCollectionViewCellName = TrainingCollectionViewCell
    
    var loginInfo: [LoginGetModel] = []
    var jobStoreModelData: [JobGetModel] = []
    var expertStoreModelData: [ExpertGetModel] = []
    var trainingStoreModelData: [TrainingGetModel] = []
    var statisticsSotreModelData: [StatisticsGetModel] = []
    
    var myIndex: Int?
    var apiRequest = APIRequest()
    var trailingURL = ""
    
    var cellIdentity = "JobCellCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarDesign()
        setUpData()
        
        jobCollectionView.register(JobCollectionViewCell.nib(), forCellWithReuseIdentifier: JobCollectionViewCell.identifire)
        expertCollectionView.register(ExpertCollectionViewCell.nib(), forCellWithReuseIdentifier: ExpertCollectionViewCell.identifire)
        trainingCollectionView.register(TrainingCollectionViewCellName.nib(), forCellWithReuseIdentifier: TrainingCollectionViewCellName.identifire)
        
        searchTextField.delegate = self
        jobCollectionView.delegate = self
        jobCollectionView.dataSource = self
        expertCollectionView.delegate = self
        expertCollectionView.dataSource = self
        trainingCollectionView.delegate = self
        trainingCollectionView.dataSource = self
        
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

        apiRequest.sendAPIRequestBackData(trailingURL: "static/statistics", method: .get, parameters: nil, headers: nil) { [self] json, error in
            guard let json = json else { return }
            print("Enter here")
            statisticsSotreModelData = []
            let statisticsLogicModel = StatisticsLogicModel()
            statisticsSotreModelData = statisticsLogicModel.setDataContainer(json: json)
            self.setstatistics(jsonData: self.statisticsSotreModelData[0])
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func profileImageButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Menu", sender: self)
    }
    @IBAction func jobCreateButtonAction(_ sender: UIButton) {
        keyboardDisappearFirst(view: view)
        performSegue(withIdentifier: "JobCreate", sender: self)
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
    
    @IBAction func expertListingButtonAction(_ sender: UIButton) {
        keyboardDisappearFirst(view: view)
        performSegue(withIdentifier: "Expert", sender: self)
    }
    @IBAction func jobListingButtonAction(_ sender: UIButton) {
        keyboardDisappearFirst(view: view)
        performSegue(withIdentifier: "Job", sender: self)
    }
    @IBAction func trainingListingButtonAction(_ sender: UIButton) {
        keyboardDisappearFirst(view: view)
        performSegue(withIdentifier: "Training", sender: self)
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        keyboardDisappearFirst(view: view)
    }
}
