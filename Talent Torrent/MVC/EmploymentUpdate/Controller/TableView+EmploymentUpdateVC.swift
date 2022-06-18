//
//  TableView+EmploymentUpdateVC.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 31/8/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import UIKit

extension EmploymentUpdateVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmploymentWorkTypeTableViewCell.identifire, for: indexPath) as! EmploymentWorkTypeTableViewCell
        cell.workTypeLabel.text = workTypeList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        workTypeTextfield.text = workTypeList[indexPath.row]
        dropDownListContainerView.isHidden = true
        dropDownIconImageView.transform = dropDownIconImageView.transform.rotated(by: .pi)
    }
}
