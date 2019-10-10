//
//  EventTypesRouter.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesRouterProtocol: class {
	func showMain()
}

class EventTypesRouter: BaseRouter {
}

extension EventTypesRouter: EventTypesRouterProtocol {
	
	func showMain() {
		let controller = UIStoryboard(name: "Main", bundle: nil)
			.instantiateViewController(withIdentifier: MainView.storyboardIdentifier)
		self.show(controller)
	}
}
