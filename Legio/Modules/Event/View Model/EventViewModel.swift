//
//  EventViewModel.swift
//  Legio
//
//  Created by Mac on 26.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import UIKit

struct EventViewModel {
    
    private enum DefaultConstants {
        static let imageName: String = "eventImage"
        static let urlString: String = ""
    }
    let name: String
    let date: String
    let place: String
    
    let imageUrl: URL?
    let defaultImage: UIImage?
    
    init(event: Event) {
        self.name = event.name
        self.place = "\(event.location.country), \(event.location.city), \(event.location.address)"
        self.date = DateStringConverter.convert(input: event.startsAt)
        self.imageUrl = URL(string: event.posterImage?.defaultUrl ?? DefaultConstants.urlString)
        self.defaultImage = UIImage(named: DefaultConstants.imageName)
    }
}
