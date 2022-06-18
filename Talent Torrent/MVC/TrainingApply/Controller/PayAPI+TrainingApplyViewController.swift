//
//  PayAPI+TrainingApplyViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 25/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension TrainingApplyViewController: TrainingPayAPIPostRequestDataSource {

    func trainingApplyErrorFromAPI(errorMassage: String) {
        let delimiter = ": "
        let token = errorMassage.components(separatedBy: delimiter)
        print("Checkpoint If got error")
        print (token[1])
    }
    func trainingApplyDataFromAPI(model: Any) {
//        let model = model as! TrainingPayModelName
//        storeTrainingPayModelData = model.data
        print(model)
    }

}
