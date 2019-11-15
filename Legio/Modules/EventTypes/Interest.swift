//
//  Interest.swift
//  Legio
//
//  Created by Mac on 10.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

class Interest {
    
    var id: Int
    var name: String
    var isOpened: Bool
    var subInterests: [Interest]
    var cellWidth: CGFloat
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.isOpened = false
        self.subInterests = []
        self.cellWidth = 0
    }
    
    init(id: Int, name: String, subInterests: [Interest]) {
        self.id = id
        self.name = name
        self.isOpened = false
        self.subInterests = subInterests
        self.cellWidth = 0
    }
    
    func getSelectedSubinterestsCount() -> Int {
        let selectedCount = subInterests.filter({$0.isOpened}).count
        return selectedCount
    }
    
}
