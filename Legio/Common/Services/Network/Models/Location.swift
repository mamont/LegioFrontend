//
//  Location.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class Location: Codable {
    
    let city: String
    let country: String
    let address: String
    let coordinates: [Double]
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
        case address = "address"
        case coordinates = "coordinates"
    }
    
}
