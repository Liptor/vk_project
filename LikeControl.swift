//
//  LikeControl.swift
//  interface_project
//
//  Created by acer on 12.11.2022.
//

import UIKit

class HeartLike {
    var isLiked: Bool = false
    var count: Int = 0
    
    init(isLiked: Bool = false, count: Int = 0) {
        self.isLiked = isLiked
        self.count = count
    }
}

class LikeControl: UIControl {
    var like = HeartLike()
    
    @IBAction func likeButton(_ sender: Any) {
        if (like.isLiked) {
            like.isLiked = false
            like.count = like.count - 1
        } else {
            like.isLiked = true
            like.count = like.count + 1
        }
    }
    
}
