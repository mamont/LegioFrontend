//
//  MainView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol MainViewProtocol {
	
}

enum EventType: Int, CaseIterable {
	case nerby 	= 0
	case middle = 1
	case party 	= 2
	
	var next: EventType {
		switch self {
		case .nerby: return .middle
		case .middle: return .party
		case .party: return .party
		}
	}
	
	var last: EventType {
		switch self {
		case .party: return .middle
		case .middle: return .nerby
		case .nerby: return .nerby
		}
	}
}

class MainView: UIViewController {
	
	@IBOutlet weak var labelEventTitle: UILabel!
	@IBOutlet weak var buttonNerby: UIButton!
	@IBOutlet weak var buttonParty: UIButton!
	private var currentEventType: EventType = .middle
	
	private var events: [String] = [ "Event Nerby",
									 "Event Middle",
									 "Event Party"]
	
	var router: MainRouterProtocol?
	private let titleText = "Event Types"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = titleText
		router = MainRouter(controller: self)
		changeEvent()
	}
	
}

//MARK: - Actions
extension MainView {
	
	@IBAction func buttonNerbyTapped(_ sender: Any) {
		currentEventType = currentEventType.last
		changeEvent()
	}
	
	@IBAction func buttonPartyTapped(_ sender: Any) {
		currentEventType = currentEventType.next
		changeEvent()
	}
	
	@IBAction func buttonNextTapped(_ sender: Any) {
		router?.showMain()
	}
	
}

extension MainView {
	
	private func changeEvent() {
		let eventTitle = events[currentEventType.rawValue]
		labelEventTitle.text = eventTitle
		
		var nerbyEnable = false
		var partyEnable = false
		switch currentEventType {
		case .nerby:
			partyEnable = true
		case .party:
			nerbyEnable = true
		case .middle:
			partyEnable = true
			nerbyEnable = true
		}
		buttonNerby.isEnabled = nerbyEnable
		buttonParty.isEnabled = partyEnable
	}
}
