//
//  News.swift
//  interface_project
//
//  Created by acer on 30.11.2022.
//

import UIKit

class News {
    let image: UIImage?
    let user: String
    let date: String
    let textBody: String?
    let isLiked: Bool
    let likesCount: Int?
    
    init(image: UIImage? = nil, user: String, date: String, textBody: String?, isLiked: Bool, likesCount: Int? = 0) {
        self.image = image
        self.user = user
        self.date = date
        self.textBody = textBody
        self.isLiked = isLiked
        self.likesCount = likesCount
    }
}
