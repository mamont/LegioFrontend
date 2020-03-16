//
//  NetworkSettings.swift
//  Legio
//
//  Created by Mac on 01.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class NetworkSettings {
    
    static var shared = NetworkSettings()
    
    internal let baseUrlString: String = "http://legio.hntr.info/v1"
    
    internal var token: String? 
    
    private init() {}
    
    
}
