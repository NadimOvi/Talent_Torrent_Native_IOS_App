//
//  Extension.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 15/7/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

// MARK:- Check keyboard is viewable or not
//if UIApplication.shared.isKeyboardPresented {
//    view.endEditing(true)
//}
extension UIApplication {
    /// Checks if view hierarchy of application contains `UIRemoteKeyboardWindow` if it does, keyboard is presented
    var isKeyboardPresented: Bool {
        if let keyboardWindowClass = NSClassFromString("UIRemoteKeyboardWindow"),
            self.windows.contains(where: { $0.isKind(of: keyboardWindowClass) }) {
            return true
        } else {
            return false
        }
    }
}
