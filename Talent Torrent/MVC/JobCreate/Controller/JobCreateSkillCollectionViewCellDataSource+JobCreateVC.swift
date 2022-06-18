//
//  JobCreateSkillCollectionViewCellDataSource+JobCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation

extension JobCreateVC: JobCreateSkillCollectionViewCellDataSource {
    func didSelectItemCloseButton(tag: Int) {
        storeFavoriteSubCatagory.remove(at: tag)
        if storeFavoriteSubCatagory.isEmpty {
            tagCollectionContainerView.isHidden = true
        } else {
            tagCollectionContainerView.isHidden = false
        }
        tagCollectionView.reloadData()
    }
}
