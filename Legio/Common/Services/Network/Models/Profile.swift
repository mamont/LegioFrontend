//
//  Profile.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class Profile: Decodable {
    
    var name: String
    var identity: String
    var interests: [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "friendlyName"
        case identity = "identity"
        case interests = "interests"
    }
    
}
