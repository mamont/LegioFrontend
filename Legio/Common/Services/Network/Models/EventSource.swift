//
//  EventSource.swift
//  Legio
//
//  Created by Марат Нургалиев on 12.05.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

final class EventSource: Codable {
    
    let url: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        
        case url = "url"
        case name = "name"
    }
    
}
