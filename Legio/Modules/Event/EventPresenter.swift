//
//  EventPresenter.swift
//  Legio
//
//  Created by Mac on 20.10.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventPresenterProtocol: class {
    func profileTapped()
    func detailsTapped(url: String)
    func loadEvent() -> Event?
    func configureTextLabel(string: String) -> NSAttributedString
    func correctAddress(address: String) -> String
}

class EventPresenter {
    weak var view: EventViewProtocol?
    var interactor: EventInteractorProtocol!
    var router: EventRouterProtocol!
    
}

extension EventPresenter: EventPresenterProtocol {
    
    func profileTapped() {
        router.showPreset()
    }
    
    func detailsTapped(url: String) {
        router.showDetails(url: url)
    }
    
    func loadEvent() -> Event? {
        return interactor.loadEvent()
    }
    
    func configureTextLabel(string: String) -> NSAttributedString {
        let textBgColor: UIColor = UIColor.legio.legioBlue
        let attributes = [NSAttributedString.Key.backgroundColor: textBgColor]
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        return attributedString
    }
    
    func correctAddress(address: String) -> String {
        let dictionary: [String: String] = [
            "площадь": "пл.",
            "район": "р-н",
            "бульвар": "б-р",
            "линия": "линия",
            "шоссе": "ш.",
            "улица": "ул.",
            "дом": "д.",
            "проспект": "пр-т",
            "корпус": "корп.",
            "проезд": "пр.",
            "строение": "стр.",
            "переулок": "пер.",
            "этаж": "этаж",
            "набережная": "наб.",
            "квартира":"кв."
            ]
        var correctAddress = address

        for (key, value) in dictionary {
            correctAddress = correctAddress.replacingOccurrences(of: key, with: value)
        }
        return correctAddress
    }
    
}
