//
//  Session.swift
//  interface_project
//
//  Created by acer on 06.12.2022.
//

import Foundation

// Singleton

class Session {
    
    static let instance = Session()
    private init() {}
    
    var token = ""
    var userId = 0
    
}
