//
//  Function.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 14/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

//func statusNavBarViewDesign(view: UIView) {
//    view.layer.cornerRadius = 20;
//    view.layer.masksToBounds = true;
//    view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//    view.backgroundColor = #colorLiteral(red: 0.07310714573, green: 0.1921634674, blue: 0.3150938749, alpha: 1)
//}
//
//func setTextViewBorder(textView: UITextView) {
//    textView.layer.cornerRadius = 10
//    textView.layer.borderWidth = 1
//    textView.layer.borderColor = #colorLiteral(red: 0.07310714573, green: 0.1921634674, blue: 0.3150938749, alpha: 0.2049099752)
//}

func convertDateFormater(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
    
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return  dateFormatter.string(from: date!)

}
func keyboardDisappearFirst(view: UIView) {
    if UIApplication.shared.isKeyboardPresented {
        view.endEditing(true)
    }
}
