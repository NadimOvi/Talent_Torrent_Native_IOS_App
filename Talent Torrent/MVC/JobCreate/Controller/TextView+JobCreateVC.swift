//
//  TextView+JobCreateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 27/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension JobCreateVC: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setMoreConstant()
//        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height), animated: true)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = UIColor.white
        setLessConstant()
    }
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//
//    }
//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//
//    }
    func textViewDidChange(_ textView: UITextView) {
        print("123")
    }
}
