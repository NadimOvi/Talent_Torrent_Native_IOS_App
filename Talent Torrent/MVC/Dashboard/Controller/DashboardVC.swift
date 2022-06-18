//
//  DashboardVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 22/5/21.
//

import UIKit
import Alamofire
import Kingfisher

class DashboardVC: UIViewController {
    
    
    @IBOutlet weak var fullViewContainerStackView: UIStackView!
    
    //    MARK:- Dropdown Table view outlet
    
    @IBOutlet weak var clientBodyContainerView: UIView!
    @IBOutlet weak var expertBodyContainerView: UIView!
    
    
    //    MARK:- Client Profile Outlet
    @IBOutlet weak var clientProfileContainerView: ClientProfileView!
    //    MARK:- Job Create Outlet
    @IBOutlet weak var clientCreateJobContainerView: ClientCreateJobView!
    //    MARK:- Connect Outlet
    @IBOutlet weak var clientConnectionContainerView: ClientConnectionView!
    //    MARK:- Active Job Outlet
    @IBOutlet weak var clientActiveJobContainerView: ClientActiveJobView!
    //    MARK:- Drafted Job Outlet
    @IBOutlet weak var clientDraftedJobContainerView: ClientDraftedJobView!
    //    MARK:- Awarded Job Outlet
    @IBOutlet weak var clientAwardedJobContainerView: ClientAwardedJobView!
    //    MARK:- Ongoing Job Outlet
    @IBOutlet weak var clientOngoingJobContainerView: ClientOngoingJobView!
    //    MARK:- Submitted Job Outlet
    @IBOutlet weak var clientSubmittedJobContainerView: ClientSubmittedJobView!
    //    MARK:- Completed Job Outlet
    @IBOutlet weak var clientCompletedJobContainerView: ClientCompletedJobView!
    //    MARK:- Client Chahge Password
    @IBOutlet weak var clientChangePasswordContainerVie: ClientChangePasswordView!
    
 
    
    //    FIXME:- Expert Outlet
    
    //    MARK:- Expert Profile Outlet
    @IBOutlet weak var expertProfileContainerView: ExpertProfileView!
    
    //    MARK:- Expert Transactions Outlet
    @IBOutlet weak var expertConnectionContainerView: ExpertConnectionView!
    
    //    MARK:- Expert Transactions Outlet
    @IBOutlet weak var expertAppliedJobContainerView: ExpertAppliedJobView!
    
    //    MARK:- Expert Transactions Outlet
    
    @IBOutlet weak var expertAwardedJobContainerView: ExpertAwardedJobView!
    
    //    MARK:- Expert Transactions Outlet
    
    @IBOutlet weak var expertOngoingJobContainerView: ExpertOngoingJobView!
    
    //    MARK:- Expert Transactions Outlet

    @IBOutlet weak var expertSubmittedJobContainerView: ExpertSubmittedJobView!
    
    //    MARK:- Expert Transactions Outlet

    @IBOutlet weak var expertCompletedJobContainerView: ExpertCompleteJobView!
    
    //    MARK:- Expert Transactions Outlet
    
    @IBOutlet weak var expertChangePasswordContainerView: ExpertChangePasswordView!
    //    MARK:- Bottom Menu Outlet
    @IBOutlet weak var menuContainerHeightConstant: NSLayoutConstraint!
    

    
    // Clinet Bottom Menu Button Action
    @IBOutlet weak var clientMenuScrollView: UIScrollView!
    
    @IBOutlet weak var clientTransactionButton: UIButton!
    @IBOutlet weak var clientPaymentInformationButton: UIButton!
    @IBOutlet weak var clientInviteFriendButton: UIButton!
    
    @IBOutlet weak var countActiveJobLabel: UILabel!
    @IBOutlet weak var countDraftedJobLabel: UILabel!
    @IBOutlet weak var countAwardedJobLabel: UILabel!
    
    
    
    // Expert Bottom Menu Button Action
    
    
    @IBOutlet weak var expertTransactionButton: UIButton!
    @IBOutlet weak var expertPaymentInformationButton: UIButton!
    @IBOutlet weak var expertInviteFriendButton: UIButton!
    
    @IBOutlet weak var expertAppliedJobLabel: UILabel!
    @IBOutlet weak var expertAwardedJobLabel: UILabel!
    @IBOutlet weak var expertOngoingJobLabel: UILabel!
    @IBOutlet weak var expertSubmittedJobLabel: UILabel!
    @IBOutlet weak var expertCompleteJobLabel: UILabel!
    
    
    @IBOutlet weak var expertMenuScrollView: UIScrollView!
    
    
    typealias ModelName = LoginGetModel
    typealias CollectionViewCellName = JobCollectionViewCell
    
    var countryShortName: String? = "bd"
    
    var storeAnyStructureData: [Any] = []
    var loginInfo: [LoginGetModel] = []
    var storeModelData: [JobGetModel] = []
    var storeCountryData: [CountryGetModel] = []
    
    var myIndex: Int?
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    
    var trailingURL = ""
    var cellIdentity = "JobCollectionViewCell"
    
    let profileImagePickerController = UIImagePickerController()
    let coverImagePickerController = UIImagePickerController()
    
    let group = DispatchGroup()
    
    //    MARK:- View Did load Method 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        temporyHideButtonOutlet()
        let userId: String = defaults.string(forKey: "userID") ?? ""
        
        headers = [
            "Authorization" : "Bearer \(userId)",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
                
        clientProfileContainerView.delegate = self
        clientCreateJobContainerView.delegate = self
        clientActiveJobContainerView.delegate = self
        clientDraftedJobContainerView.delegate = self
        clientAwardedJobContainerView.delegate = self
        
        expertProfileContainerView.delegate = self
        expertAppliedJobContainerView.delegate = self
        expertAwardedJobContainerView.delegate = self
        expertOngoingJobContainerView.delegate = self
        expertSubmittedJobContainerView.delegate = self
        expertCompletedJobContainerView.delegate = self
                
                
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
    
    //    MARK:- Client Menu Area
    
    
    
    //    MARK:- Profile >> Client
    @IBAction func profileClientButtonAction(_ sender: UIButton) {
        self.title = "Profile"
        clientBodyContainerHide(clientProfileContainerView)
    }
    //    MARK:- Create Job >> Client
    @IBAction func createJobButtonAction(_ sender: UIButton) {
        self.title = "Create Job"
        clientBodyContainerHide(clientCreateJobContainerView)
    }
    //    MARK:- Transactions >> Client
    @IBAction func transactionsClientButtonAction(_ sender: UIButton) {
    }

    //    MARK:- connections >> Client
    @IBAction func connectionsClientButtonAction(_ sender: UIButton) {
        self.title = "Connections"
        clientBodyContainerHide(clientConnectionContainerView)
    }
    //    MARK:- Active Job >> Client
    @IBAction func activeJobButtonAction(_ sender: UIButton) {
        self.title = "Active Job"
        clientBodyContainerHide(clientActiveJobContainerView)
    }
    //    MARK:- Drafted Job >> Client
    @IBAction func draftedJobButtonAction(_ sender: UIButton) {
        self.title = "Drafted Job"
        clientBodyContainerHide(clientDraftedJobContainerView)
    }
    //    MARK:- Awarded Job  >> Client
    @IBAction func awardedClientJobButtonAction(_ sender: UIButton) {
        self.title = "Awarded Job"
        clientBodyContainerHide(clientAwardedJobContainerView)
    }
    //    MARK:- ongoing Job >> Client
    @IBAction func ongoingClientButtonAction(_ sender: UIButton) {
        self.title = "Ongoing Job"
        clientBodyContainerHide(clientOngoingJobContainerView)
//
    }
    //    MARK:- submitted Job >> Client
    @IBAction func submittedClientButtonAction(_ sender: UIButton) {
        self.title = "Submitted Job"
        clientBodyContainerHide(clientSubmittedJobContainerView)
    }
    //    MARK:- completed Job >> Client
    @IBAction func completedClientButtonAction(_ sender: UIButton) {
        self.title = "Completed Job"
        clientBodyContainerHide(clientCompletedJobContainerView)
    }
    //    MARK:- payment Information >> Client
    @IBAction func paymentClientButtonAction(_ sender: UIButton) {
    }
    //    MARK:- Change Password >> Client
    @IBAction func changePasswordClientButtonAction(_ sender: UIButton) {
        self.title = "Change Password"
        clientBodyContainerHide(clientChangePasswordContainerVie)
    }
    //    MARK:- Invite Friends >> Client
    @IBAction func inviteFriendsClientButtonAction(_ sender: UIButton) {
    }
    
    //    FIXME:- Expert Menu Area

    
    //    MARK:- Profile >> Expert
    @IBAction func profileExpertButtonAction(_ sender: UIButton) {
        self.title = "Profile"
        ecpertBodyContainerHide(expertProfileContainerView)
    }
    //    MARK:- Transactions >> Expert
    @IBAction func transactionsExpertButtonAction(_ sender: UIButton) {
        
    }
    //    MARK:- Message >> Expert

    //    MARK:- connections >> Expert
    @IBAction func connectionsExpertButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertConnectionContainerView)
    }
    //    MARK:- Applied Job >> Expert
    @IBAction func appliedJobButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertAppliedJobContainerView)
    }
    //    MARK:- Awarded Job >> Expert
    @IBAction func awardedJobButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertAwardedJobContainerView)
    }
    //    MARK:- ongoing Job >> Expert
    @IBAction func ongoingExpertButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertOngoingJobContainerView)
    }
    //    MARK:- submitted Job >> Expert
    @IBAction func submittedExpertButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertSubmittedJobContainerView)
    }
    //    MARK:- completed Job >> Expert
    @IBAction func completedExpertButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertCompletedJobContainerView)
    }
    //    MARK:- payment Information >> Expert
    @IBAction func paymentExpertButtonAction(_ sender: UIButton) {
    }
    //    MARK:- Change Password >> Expert
    @IBAction func changePasswordExpertButtonAction(_ sender: UIButton) {
        ecpertBodyContainerHide(expertChangePasswordContainerView)
    }
    
    
    
    //    MARK:- Bottom menu show || hide
    
    @IBAction func bottomMenuAction(_ sender: UIButton) {
        if menuContainerHeightConstant.constant == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.menuContainerHeightConstant.constant = 160
                self.view.layoutIfNeeded()
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.menuContainerHeightConstant.constant = 0
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
