//
//  CollectionView+HomeVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 13/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == jobCollectionView {
            return jobStoreModelData.count
        } else if collectionView == expertCollectionView {
            return expertStoreModelData.count
        } else {
            return trainingStoreModelData.count
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == jobCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCollectionViewCell.identifire, for: indexPath) as! JobCollectionViewCellName
            
            cell.setCellProperty(jobStoreModelData[indexPath.row])
            
            return cell
        }  else if collectionView == expertCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExpertCollectionViewCell.identifire, for: indexPath) as! ExpertCollectionViewCell
            
            cell.setCellProperty(expertStoreModelData[indexPath.row])
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingCollectionViewCell.identifire, for: indexPath) as! TrainingCollectionViewCellName
            
            cell.setCellProperty(trainingStoreModelData[indexPath.row], indexPath: indexPath)
            
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myIndex = indexPath.row
        if UIApplication.shared.isKeyboardPresented {
            view.endEditing(true)
        } else if collectionView == jobCollectionView {
            performSegue(withIdentifier: "JobDetails", sender: self)
        } else if collectionView == expertCollectionView {
            performSegue(withIdentifier: "ExpertDetails", sender: self)
        } else {
            performSegue(withIdentifier: "TrainingDetails", sender: self)
        }
    }

}
//MARK:- CollectionView FlowLayout
extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == jobCollectionView {
            return CGSize(width: collectionView.bounds.width - 32, height: 257)
        } else if collectionView == expertCollectionView {
            return CGSize(width: collectionView.bounds.width - 32, height: 257)
        } else {
            return CGSize(width: collectionView.bounds.width - 32, height: 222)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }
    
}
