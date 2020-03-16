//
//  Location.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class Location: Decodable {
    
    var city: String
    var country: String
    
    enum CodingKeys: String, CodingKey {
        
        case city = "city"
        case country = "country"
    }
    
}
