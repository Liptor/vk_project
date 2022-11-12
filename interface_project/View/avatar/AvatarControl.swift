//
//  AvatarControl.swift
//  interface_project
//
//  Created by acer on 07.11.2022.
//

import UIKit

class AvatarControl: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
            layer.shadowColor  = UIColor.black.cgColor
            layer.shadowOffset = .zero
            layer.shadowRadius = 10
            layer.shadowOpacity = 0.5

    }
    

}
