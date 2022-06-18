//
//  JobCreateSkillCollectionViewCellDataSource+ClientCreateJob.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation

extension ClientCreateJobView: JobCreateSkillCollectionViewCellDataSource {
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
