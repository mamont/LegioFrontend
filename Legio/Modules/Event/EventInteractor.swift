//
//  EventInteractor.swift
//  Legio
//
//  Created by Mac on 20.10.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol EventInteractorProtocol {
    func loadEvent() -> Event?
}

class EventInteractor: EventInteractorProtocol {
    var event: Event?
    
    // данный код должен будет перейти в NetworkManager,  но в качестве модуля пойдет
    func loadEvent() -> Event? {
        var urlConstructor = URLComponents()
        let authValue: String? = "Bearer \(userData.token)"
        urlConstructor.scheme = "http"
        urlConstructor.host = "legio-app.tmweb.ru"
        urlConstructor.path = "/api/events"

        guard let registerURL = urlConstructor.url else {
            return nil
        }
        var request = URLRequest(url: registerURL)
        request.httpMethod = "POST"
        request.setValue(authValue, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                do {
                    let items = try JSONDecoder().decode(Event.self, from: data)
                    self.event?.id = items.id
                    self.event?.created = items.created
                    self.event?.updated = items.updated
                    self.event?.name = items.name
                    self.event?.category = items.category
                    self.event?.createdAt = items.createdAt
                    self.event?.starts = items.starts
                    self.event?.ends = items.ends
                    self.event?.image = items.image
                    self.event?.url = items.url
                    self.event?.location = items.location
                    self.event?.organization = items.organization
                    self.event?.tagName = items.tagName
                    self.event?.categoryName = items.categoryName
                } catch let error {
                    print(error)
                }
            }
        }.resume()
        return event
    }
    
}

