//
//  PresetRouter.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol PresetRouterProtocol: class {
	func showEventTypes()
}

class PresetRouter: BaseRouter {
}

extension PresetRouter: PresetRouterProtocol {
	
	func showEventTypes() {
		let controller = UIStoryboard(name: "EventTypes", bundle: nil)
			.instantiateViewController(withIdentifier: EventTypesView.storyboardIdentifier)
		self.show(controller)
	}
}

