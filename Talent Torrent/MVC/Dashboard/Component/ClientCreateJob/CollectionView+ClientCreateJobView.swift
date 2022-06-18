//
//  CollectionView+ClientCreateJobView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension ClientCreateJobView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count storefasdf: \(storeFavoriteSubCatagory.count)")
        return storeFavoriteSubCatagory.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCreateSkillCollectionViewCell.identifire, for: indexPath) as! JobCreateSkillCollectionViewCell
        
        cell.setCellComponetProperty(cell: storeFavoriteSubCatagory[indexPath.row], itemIndex: indexPath.row)
        cell.delegate = self
        
        return cell
    }
}
//MARK:- CollectionView FlowLayout
extension ClientCreateJobView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: collectionView.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

