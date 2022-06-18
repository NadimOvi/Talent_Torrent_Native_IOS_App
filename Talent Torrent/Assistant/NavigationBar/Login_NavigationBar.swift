//
//  Login_NavigationBar.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 26/5/21.
//

import UIKit

class Login_NavigationBar: UINavigationBar {
    
    @IBOutlet var view: UIView!
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInti()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commonInti()
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func commonInti() {
//        // first: load the view hierarchy to get proper outlets
//        Bundle.main.loadNibNamed("Login_NavigationBar", owner: self, options: nil)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        // next: append the container to our view
//        addSubview(view)
//        NSLayoutConstraint.activate(
//           [
//              view.topAnchor.constraint(equalTo: topAnchor),
//              view.leadingAnchor.constraint(equalTo: leadingAnchor),
//              view.bottomAnchor.constraint(equalTo: bottomAnchor),
//              view.trailingAnchor.constraint(equalTo: trailingAnchor),
//           ]
//         )
////        var isLeftButtonHidden: Bool {
////          set {
////             leftButton.isHidden = newValue
////          }
////          get {
////             return leftButton.isHidden
////          }
////        }
////
////        var isRightFirstButtonEnabled: Bool {
////          set {
////             rightFirstButton.isEnabled = newValue
////          }
////          get {
////             return rightFirstButton.isEnabled
////          }
////        }
//    }
 
    override class func awakeFromNib() {
        Bundle.main.loadNibNamed("Login_NavigationBar", owner: self, options: nil)
    }
    // first: load the view hierarchy to get proper outlets
   
}
