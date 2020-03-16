//
//  ResponseSetTimeInvest.swift
//  Legio
//
//  Created by Mac on 19.12.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

class ResponseSetTimeInvest: Codable {
    var result: String
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
    }
    
}
