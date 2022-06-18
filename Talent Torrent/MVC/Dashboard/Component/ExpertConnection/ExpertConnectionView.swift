//
//  ExpertConnectionView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 23/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire

class ExpertConnectionView: UIView {
    
    let identifire = "ExpertConnectionView"
   
    
    
    @IBOutlet var view: UIView!
    
    var trailingUrl = "update/password"
    var apiRequest = APIRequest()
    var headers: HTTPHeaders = HTTPHeaders()
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
}


