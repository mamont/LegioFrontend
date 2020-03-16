//
//  Event.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

enum ModerationStatus: String, Decodable {
    case shown = "shown"
}

class Event: Decodable {
    
    var id: Int
    var startsAt: String
    var name: String
    var url: String
    var posterImage: PosterImage
    var location: Location
    var categories: [Category]
    var moderationStatus: String
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case startsAt = "starts_at"
        case name = "name"
        case url = "url"
        case posterImage = "poster_image"
        case location = "location"
        case categories = "categories"
        case moderationStatus = "moderation_status"
    }
    
}
