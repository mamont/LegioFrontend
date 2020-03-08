//
//  EventsService.swift
//  Legio
//
//  Created by Mac on 08.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol EventsService {
    
    func getEvents(dislikedEvents: [Int], completion: @escaping EventsResponse)
}

extension EventsService {
    
    public typealias EventsResponse = (Result<[Event], Error>) -> Void
}
