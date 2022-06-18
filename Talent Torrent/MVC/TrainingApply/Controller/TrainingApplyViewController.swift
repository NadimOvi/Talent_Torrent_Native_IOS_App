//
//  Training_Apply_ViewController.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 24/5/21.
//

import UIKit
//FIXME:- Stripe- 3
//import Stripe
import Alamofire

class TrainingApplyViewController: UIViewController {

    var storeDetailsInfo: [TrainingGetModel] = []
//    var titleString: String = ""
//    var location: String = ""
//    var duration: String = ""
//    var date: String = ""
//    var fee: String = ""
//    var trainingId: Int?
    
    @IBOutlet weak var datePickerContainerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    
    
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var couponActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var couponTextField: UITextField!
    @IBOutlet weak var couponVerifyButton: UIButton!
    
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var suburbTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var postcodeTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var participantTextField: UITextField!

    
//    FIXME:- later store coupon get model
    var storeCouponModelData: CouponMeta?
    
    var stripeIdHolder: String? = nil
    var couponTextHolder = ""
    var apiRequest = APIRequest()
    var trailingURL = ""
    
    typealias TrainingPayModelName = PayTrainingGetModel
    var trainingPaycoupnoGetModelType = PayTrainingGetModel.self
    var trainingPaycoupnoTrailing_url = "trainings/register/"
    var trainingPaycoupnoApiPostRequest = TrainingPayAPIPostRequest()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerContainerView.isHidden = true

        titleLabel.text = storeDetailsInfo[0].trainingTitle
        locationLabel.text = storeDetailsInfo[0].trainingLocation
        durationLabel.text = storeDetailsInfo[0].trainingDuration
        dateLabel.text = storeDetailsInfo[0].trainingStartDate
        feeLabel.text = String(storeDetailsInfo[0].trainingFee)
        
        couponActivityIndicator.isHidden = true
        
        trainingPaycoupnoApiPostRequest.delegate = self
        
    }
    
    @IBAction func couponVerifyButtonAction(_ sender: UIButton) {
        print("click me ")
        ////        FIXME:- Add constant & value
        guard let coupon = couponTextField.text,
              let training = Int(storeDetailsInfo[0].trainingId)
              
        else { return }

        couponActivityIndicator.isHidden = false
        couponActivityIndicator.startAnimating()
        //        FIXME:- Changing parameter & value
        
//        let couponObjective = CouponPostModel(coupon: couponCode, training: trainingId)
//
//        coupnoApiPostRequest.set_trailing_url(trailing_url: coupnoTrailing_url, getModelType: coupnoGetModelType, postModel: couponObjective)
        let parameters: Parameters = [ "coupon" : coupon, "training" : training ]
        trailingURL = "validate/coupon"
        apiRequest.sendAPIRequestBackData(trailingURL: trailingURL, method: .post, parameters: parameters, headers: nil) { json, error in
            if json != nil {
                
                self.couponActivityIndicator.stopAnimating()
                self.couponActivityIndicator.isHidden = true
                
                self.couponVerifyButton.backgroundColor = #colorLiteral(red: 0.07310714573, green: 0.1921634674, blue: 0.3150938749, alpha: 1)
                self.couponVerifyButton.setTitle("", for: .normal)
                self.couponVerifyButton.setImage(#imageLiteral(resourceName: "Check"), for: .normal)
                self.couponVerifyButton.backgroundColor = .white
                    
            } else {
                self.couponActivityIndicator.stopAnimating()
                self.couponActivityIndicator.isHidden = true
                self.couponVerifyButton.backgroundColor = #colorLiteral(red: 0.3618213384, green: 0, blue: 0, alpha: 1)
                self.couponVerifyButton.setImage(nil, for: .normal)
                self.couponVerifyButton.setTitle("Again", for: .normal)
                
                let delimiter = ": "
                let token = error!.components(separatedBy: delimiter)
                print (token[1])
            }
        }
        
        view.endEditing(true)
    }
    
    @IBAction func paymentByCard(_ sender: UIButton) {
        //FIXME:- Stripe- 4
//        let addCardViewController = STPAddCardViewController()
//        addCardViewController.delegate = self
//
//        let naviagationController = UINavigationController(rootViewController: addCardViewController)
//        present(naviagationController, animated: true, completion: nil)

        
    }
    
    @IBAction func PayButtonAction(_ sender: UIButton) {
        //FIXME:- Stripe- 5
//
//        print("coupon code and stripe id")
//
//        let fullTrailingUrl = "\(trainingPaycoupnoTrailing_url)\(trainingId ?? 0)"
//        print(trainingPaycoupnoTrailing_url)
//        print(couponTextHolder)
//        print(stripeIdHolder ?? "")
//
//        guard let date = dateTextField.text,
//              let paymentMethod = stripeIdHolder,
//              let participant = participantTextField.text,
//              let address = addressTextField.text,
//              let phone = phoneTextField.text,
//              let suburb = suburbTextField.text,
//              let state = stateTextField.text,
//              let postcode = postcodeTextField.text
//        else { return }
//
//
//        let payment_method = "card"
//
//        let payobj = PayTrainningPostModel(date: date, paymentMethod: paymentMethod, payment_method: payment_method, participant: participant, address: address, phone: phone, suburb: suburb, state: state, postcode: postcode, coupon: couponTextHolder)
//
//        print(payobj)
//        let userId: String = defaults.string(forKey: "userID") ?? ""
//        let headers: HTTPHeaders = [
//            "Authorization" : "Bearer \(userId)",
//            "Content-Type": "application/json",
//            "Accept": "application/json"
//        ]
//
//        trainingPaycoupnoApiPostRequest.set_trailing_url(trailing_url: fullTrailingUrl, getModelType: trainingPaycoupnoGetModelType, postModel: payobj, headers: headers)
//
//
    }
    
    @IBAction func datePickerButtonAction(_ sender: UIButton) {
        datePickerContainerView.isHidden = false
        view.endEditing(true)
    }
    
    @IBAction func datePickerValueChangeAction(_ sender: UIDatePicker) {
        datePickerContainerView.isHidden = true
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    
    @IBAction func tapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        datePickerContainerView.isHidden = true
    }
    
}
