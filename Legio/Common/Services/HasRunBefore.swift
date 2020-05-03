//
//  HasRunBefore.swift
//  Legio
//
//  Created by Sergey Mikhailov on 03.05.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

class HasRunBefore {
    static var yes: Bool {
        get {
            let userDefaults = UserDefaults.standard
            guard (userDefaults.object(forKey: "hasRunBefore") != nil) else {
                userDefaults.set(true, forKey: "hasRunBefore")
                return false
            }
            return true
        }
    }
}
