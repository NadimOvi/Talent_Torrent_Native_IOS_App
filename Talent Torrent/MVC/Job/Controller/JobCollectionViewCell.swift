//
//  JobCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
//FIXME:- Set cell outlet
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
//    @IBOutlet weak var remainDayLabel: UILabel!
    @IBOutlet weak var dateOfPostLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    
    static let identifire = "JobCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "JobCollectionViewCell", bundle: nil)
    }
    
    var skill: [String?] = []
    
    typealias CollectionViewCellName = JobCellCollectionViewCell
    var cellIdentity = "JobCellCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        cellCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
    }
//    FIXME:- Change Parameter Datatye & set variable
    func setCellProperty(_ data: JobGetModel) {
        jobTitleLabel.text = data.jobTitle
        budgetLabel.text = data.jobBudget
//        remainDayLabel.text = data.jobRemainDay
        dateOfPostLabel.text = data.jobDateOfPost
        jobDescriptionLabel.attributedText = data.jobDescription.htmlToAttributedString
        skill.append(">>")
        skill.append(contentsOf: data.jobtags)
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
extension JobCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

