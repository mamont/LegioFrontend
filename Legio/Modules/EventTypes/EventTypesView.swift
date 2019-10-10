//
//  EventTypesView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesViewProtocol {
	
}

class EventTypesView: UIViewController {
	
	var router: EventTypesRouterProtocol?
	private let titleText = "Event Types"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = titleText
		router = EventTypesRouter(controller: self)
	}
	
}

//MARK: - Actions
extension EventTypesView {
	
	@IBAction func buttonNextTapped(_ sender: Any) {
		router?.showMain()
	}
	
}
