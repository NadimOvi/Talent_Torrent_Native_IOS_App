//
//  ExpertSubmittedJobView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

protocol ExpertSubmittedJobViewDelegate {
    func expertSubmittedJobInfo(totalNumber: String)
}

class ExpertSubmittedJobView: UIView {

    let identifire = "ExpertSubmittedJobView"
    var delegate: ExpertSubmittedJobViewDelegate?
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    var trailingURL = ""
    // FIXME:- cell identifire remover form her and add identifire in JobCollectionViewCell file
    var cellIdentity = "JobCollectionViewCell"
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noJobFoundShowLabel: UILabel!
    @IBOutlet weak var noJobFoundShowView: UIView!
    
    
    var storeModelData: [JobGetModel] = []
    var myIndex: Int?
    typealias CollectionViewCellName = JobCollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()

        let userId: String = defaults.string(forKey: "userID") ?? ""

        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: cellIdentity, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentity)
        
        trailingURL = "expert/jobs/submitted"

        print("++++++++++++++")
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .get, parameters: nil, headers: headers) { json, error in
            guard let json = json else {return}
            self.storeModelData = []
            let jobLogicModel = JobLogicModel()
            self.storeModelData = jobLogicModel.setDataContainer(json: json)
            self.collectionView.reloadData()
            if self.storeModelData.isEmpty {
                self.noJobFoundShowView.isHidden = false
                
            } else {
                self.noJobFoundShowView.isHidden = true
            }
            let totalJob = String(self.storeModelData.count)
            self.delegate?.expertSubmittedJobInfo(totalNumber: totalJob)
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        view = loadViewFromNib(nibName: identifire)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.frame = self.bounds
        addSubview(view)
    }
    func loadViewFromNib(nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
//    FIXME:- call api set number list bottom dropdown then pass here and remove api call here
    func configureView(data: LoginGetModel) {
    }
}

extension ExpertSubmittedJobView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return storeModelData.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentity, for: indexPath) as! CollectionViewCellName
            cell.setCellProperty(storeModelData[indexPath.row])
            return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            myIndex = indexPath.row
            print(myIndex!)
//        FIXME:- perform segue protocol delegate
//            performSegue(withIdentifier: "JobDetails", sender: self)
    }

}
//MARK:- CollectionView FlowLayout
extension ExpertSubmittedJobView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width  - 32, height: 257)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }
    
}



