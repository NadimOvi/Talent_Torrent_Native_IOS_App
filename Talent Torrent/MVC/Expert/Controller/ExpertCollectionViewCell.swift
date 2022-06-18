//
//  ExpertCollectionViewCell.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 12/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//


import UIKit

class ExpertCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var coverletterLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    
    
    static let identifire = "ExpertCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ExpertCollectionViewCell", bundle: nil)
    }
    
    var skill: [String?] = []
    
    typealias CollectionViewCellName = ExpertCellCollectionViewCell
    var cellIdentity = "ExpertCellCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellCollectionView.delegate = self
        cellCollectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        cellCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
        
        
    }
    //    FIXME:- Change Parameter Datatye & set variable
    func setCellProperty(_ data: ExpertGetModel) {
        
        let profileURL = URL(string: data.expertProfileImageURL)
        profileImageView.kf.setImage(with: profileURL)
        
        firstNameLabel.text = data.expartFirstName
        lastNameLabel.text = data.expertLastName
        countryLabel.text = data.expertCountry
        coverletterLabel.text = data.expertCoverLetter
        
        skill.append(">>")
        skill.append(contentsOf: data.expertSkill)

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
extension ExpertCollectionViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }

}

