//
//  User.swift
//  Legio
//
//  Created by Mac on 01.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class UserProfile: Codable {
    
    var token: String
    var justCreated: Bool
    var name: String
    var identity: String
    var interests: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "friendlyName"
        case identity = "identity"
        case token = "token"
        case justCreated = "justCreated"
        case interests = "interests"
    }
}
