//
//  CollectionView+JobViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 8/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeModelData.count
//        return 10
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentity, for: indexPath) as! CollectionViewCellName
        
        cell.setCellProperty(storeModelData[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myIndex = indexPath.row
        if UIApplication.shared.isKeyboardPresented {
            print("keyboard is presenting")
            view.endEditing(true)
        }  else {
            
            performSegue(withIdentifier: "JobDetails", sender: self)
        }
        
        
    }

}
//MARK:- CollectionView FlowLayout
extension JobViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width  - 32, height: 257)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }
    
}

