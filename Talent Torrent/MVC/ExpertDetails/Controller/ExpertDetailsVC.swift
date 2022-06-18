//
//  ExpertDetailsVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/5/21.
//

import UIKit
import Alamofire
import Kingfisher

class ExpertDetailsVC: UIViewController {
    
    
    var storeDetailsInfo: [ExpertGetModel] = []
//    var storeAppliedJobInfo: [JobGetModel] = []
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var cellCollectionView: UICollectionView!
    @IBOutlet weak var connectionButtonContainerView: UIView!
    @IBOutlet weak var connectionButtonLabel: UILabel!
    @IBOutlet weak var connectionButtonPlusView: UIView!
    @IBOutlet weak var connectionButton: UIButton!
    
    
    
    typealias ModelName = LoginGetModel
    var loginInfo: [LoginGetModel] = []
    
    var trailing_url = ""
    var apiRequest = APIRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileURL = URL(string: storeDetailsInfo[0].expertProfileImageURL)
        
        profileImageView.kf.setImage(with: profileURL)
        fullNameLabel.text = "\(storeDetailsInfo[0].expartFirstName) \(storeDetailsInfo[0].expertLastName)"
        countryLabel.text = storeDetailsInfo[0].expertCountry
        detailsLabel.text = storeDetailsInfo[0].expertCoverLetter
        
        apiRequest.delegate = self
        
        trailing_url = "connection/status/\(storeDetailsInfo[0].expertId)"
        let userId: String = defaults.string(forKey: "userID") ?? ""
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: nil, headers: headers)
        

    }

    @IBAction func connectRequestButtonAction(_ sender: UIButton) {
        print("hit me or not")
        
        trailing_url = "connection/request/\(storeDetailsInfo[0].expertId)"
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        let headers: HTTPHeaders = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        apiRequest.getPostToAPIRequest(trailingURL: trailing_url, method: .post, parameters: nil, headers: headers)
        
    }
}
