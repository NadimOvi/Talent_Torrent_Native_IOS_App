//
//  NotificationVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/5/21.
//

import UIKit
import Alamofire
class NotificationVC: UIViewController {

    @IBOutlet weak var fullViewContainerTableView: UITableView!
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias ModelName = LoginGetModel
    var loginInfo: [LoginGetModel] = []
    
    
    var storeModelData: [NotificationGetModel] = []
    var apiRequest = APIRequest()
    var trailingURL = ""
    var headers: HTTPHeaders = HTTPHeaders()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        let nib = UINib(nibName: NotificationTableViewCell.identifire, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NotificationTableViewCell.identifire)

        let nib2 = UINib(nibName: NotificationHeaderTableViewCell.identifire, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: NotificationHeaderTableViewCell.identifire)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
        setUpData()
        

        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}
