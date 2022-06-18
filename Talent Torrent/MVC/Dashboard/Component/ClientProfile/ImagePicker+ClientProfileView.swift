//
//  ImagePicker+ClientProfileView.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 10/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension ClientProfileView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            if picker == profileImagePickerController {
                
                profileImageView.image = image
            picker.dismiss(animated: true, completion: nil)
            } else if picker == coverImagePickerController {
                coverImageView.image = image
                picker.dismiss(animated: true, completion: nil)
            
            }
        }
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
