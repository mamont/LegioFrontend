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
    func detailsTapped()
    func loadEvent()
    func configureTextLabel(string: String) -> NSAttributedString
    func configureNameLabel() -> NSAttributedString
    func configureDateLabel() -> NSAttributedString
    func correctAddress() -> String
    func loadImage() -> UIImage
    func showParty()
}

class EventPresenter {
    weak var view: EventViewProtocol?
    var interactor: EventInteractorProtocol!
    var router: EventRouterProtocol!
    var event: Event?
    
    private var events: [Event] = []
    let defaultEventImage: String = "eventImage"
}

extension EventPresenter: EventPresenterProtocol {
    
    func profileTapped() {
        router.showPreset()
    }
    
    func detailsTapped() {
        router.showDetails(url: event?.url ?? "https://www.yandex.ru")
    }
    
    func loadEvent() {
//        self.interactor.getEvents { [weak self] (events, error) in
//            if let events = events,
//            events.count > 0 {
//                self?.events = events
//                self?.event = events[0]
//            } else {
//                self?.event = self?.interactor.loadEvent()
//            }
//        self?.view?.showEvent()
//        }
        self.event = self.interactor.loadEvent()
    }
    
    func loadImage() -> UIImage {
        guard let eventImageUrl = event?.image,
            let url = URL(string: eventImageUrl) else { return defaultImage() }
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data) ?? defaultImage()
        } catch {
            return UIImage(named: event!.image)!//Только для заглушки
//            return defaultImage()
        }
    }
    
    func defaultImage() -> UIImage {
        return UIImage(named: defaultEventImage)!
    }
    
    func configureTextLabel(string: String) -> NSAttributedString {
        let textBgColor: UIColor = UIColor.legio.legioBlue
        let attributes = [NSAttributedString.Key.backgroundColor: textBgColor]
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        return attributedString
    }
    
    func configureNameLabel() -> NSAttributedString {
        return configureTextLabel(string: event?.name ?? "Мультимедийные выставки «Ван Гог. Письма к Тео» и «Густав Климт. Золото Модерна»")
    }
    
    func configureDateLabel() -> NSAttributedString {
        return configureTextLabel(string: event?.starts ?? "Сегодня, 20:45")
    }
    
    func correctAddress() -> String {
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
        guard var correctAddress = event?.location else { return "Басманный пер, 5" }

        for (key, value) in dictionary {
            correctAddress = correctAddress.replacingOccurrences(of: key, with: value)
        }
        return correctAddress
    }
    
    func showParty() {
        router.showParty()
    }
    
}
