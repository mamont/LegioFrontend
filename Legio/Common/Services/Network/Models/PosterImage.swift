//
//  PosterImage.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class PosterImage: Codable {
    
    let defaultUrl: String?
    let uploadcareUrl: String?
    
    enum CodingKeys: String, CodingKey {
        
        case defaultUrl = "default_url"
        case uploadcareUrl = "uploadcare_url"
    }
    
}

