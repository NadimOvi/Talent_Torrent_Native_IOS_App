//
//  JobDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/5/21.
//

import UIKit

class JobDetailsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    var storeDetailsInfo: [JobGetModel] = []
    
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
//    @IBOutlet weak var remainDayLabel: UILabel!
    @IBOutlet weak var dateOfPostLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    @IBOutlet weak var jobApplyButtonContainer: UIView!
    @IBOutlet weak var appliedUsersButtonContainer: UIView!
    @IBOutlet weak var jobUpdateButtonContainer: UIView!
    
    var skill: [String?] = []
    
    typealias CollectionViewCellName = JobCellCollectionViewCell
    var cellIdentity = "JobCellCollectionViewCell"
    
    typealias ModelName = LoginGetModel
    var loginInfo: [LoginGetModel] = []
    var storeClientJob: [JobGetModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        cellCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
        
        hideButtonContainer()
        setUpData()
        
        jobTitleLabel.text = storeDetailsInfo[0].jobTitle
        budgetLabel.text = storeDetailsInfo[0].jobBudget
//        remainDayLabel.text = storeDetailsInfo[0].jobRemainDay
        dateOfPostLabel.text = storeDetailsInfo[0].jobDateOfPost
        jobDescriptionLabel.attributedText = storeDetailsInfo[0].jobDescription.htmlToAttributedString
        
        skill.append(">>")
        skill.append(contentsOf: storeDetailsInfo[0].jobtags)

        
    }
    
    @IBAction func jobApplyButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "JobApply", sender: self)
    }
    
    @IBAction func jobAppliedUserButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "JobAppliedUser", sender: self)
    }
    
    @IBAction func jobUpdateButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "JobUpdate", sender: self)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skill.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = cellCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentity, for: indexPath) as! CollectionViewCellName
        cell.setCellProperty(skill[indexPath.row])

        return cell
    }
    
}

//MARK:- CollectionView FlowLayout
extension JobDetailsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
