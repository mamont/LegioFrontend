//
//  EventInteractor.swift
//  Legio
//
//  Created by Mac on 20.10.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol EventInteractorProtocol {
    func getEvents(
        city: String?,
        location: String?,
        distance: Float?,
        metro: String?,
        completion: @escaping EventsService.EventsResult)
}

class EventInteractor: EventInteractorProtocol {
    
    var event: Event?
    private let eventsService: EventsService = EventsServiceImplementation()
    
    internal func getEvents(
        city: String? = nil,
        location: String? = nil,
        distance: Float? = nil,
        metro: String? = nil,
        completion: @escaping EventsService.EventsResult) {
        
        eventsService.getEvents(
            city: city,
            location: location,
            distance: distance,
            metro: metro,
            completion: completion)
    }
}

