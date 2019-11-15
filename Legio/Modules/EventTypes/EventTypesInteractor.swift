//
//  EventTypesInteractor.swift
//  Legio
//
//  Created by Mac on 09.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesInteractorProtocol {
    func getInterestList(completion: @escaping(_ interests: [Interest]) -> Void)
}

class EventTypesInteractor: EventTypesInteractorProtocol {

    internal func getInterestList(completion: @escaping(_ interests: [Interest]) -> Void) {
        var interests: [Interest] = []
        interests.append(Interest(id: 0, name: "Кино"))
        interests.append(Interest(id: 0, name: "Музыка"))
        interests.append(Interest(id: 0, name: "Бары"))
        interests.append(Interest(id: 0, name: "Путешествия"))
        interests.append(Interest(id: 0, name: "Длиннннннннннннннннннныйтег"))
        interests.append(Interest(id: 0, name: "Музеи"))
        
        var subInterests: [Interest] = []
        subInterests.append(Interest(id: 0, name: "Классика"))
        subInterests.append(Interest(id: 0, name: "Авангард"))
        subInterests.append(Interest(id: 0, name: "Популярная"))
        subInterests.append(Interest(id: 0, name: "Рок"))
        interests[1].subInterests = subInterests
        
        completion(interests)
    }
    
}
