//
//  Category.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

final class Category: Codable {
    
    let id: Int
    let name: String
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case slug = "slug"
    }
    
}
