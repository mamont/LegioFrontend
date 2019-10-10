//
//  ForgotRouter.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol ForgotRouterProtocol: class {
	func showForgot()
}

class ForgotRouter: BaseRouter {
	
}

extension ForgotRouter: ForgotRouterProtocol {
	
	func showForgot() {
		let controller = UIStoryboard(name: "Preset", bundle: nil)
			.instantiateViewController(withIdentifier: PresetView.storyboardIdentifier)
		self.show(controller)
	}
}
