//
//  FriendTableViewCell.swift
//  interface_project
//
//  Created by acer on 14.11.2022.
//

import UIKit

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}

class FriendTableViewCell: UITableViewCell {
    @IBOutlet weak var fiendImage: UIImageView!
    @IBOutlet weak var friendLabel: UILabel!
    
}
