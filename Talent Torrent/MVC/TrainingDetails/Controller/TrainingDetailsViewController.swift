//
//  Training_Details_ViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/5/21.
//

import UIKit

class TrainingDetailsViewController: UIViewController {

    var storeDetailsInfo: [TrainingGetModel] = []
    
    var titleString: String = ""
    var location: String = ""
    var duration: String = ""
    var available: String = ""
    var date: String = ""
    var fee: String = ""
    var details: String = ""
    var trainingId: Int?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = storeDetailsInfo[0].trainingTitle
        locationLabel.text = storeDetailsInfo[0].trainingLocation
        durationLabel.text = storeDetailsInfo[0].trainingDuration
        dateLabel.text = storeDetailsInfo[0].trainingStartDate
        feeLabel.text = String(storeDetailsInfo[0].trainingFee)
        detailsLabel.attributedText = storeDetailsInfo[0].trainingDetails.htmlToAttributedString
    }

    @IBAction func trainingDetailsButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "TrainingApply", sender: self)
    }
}
