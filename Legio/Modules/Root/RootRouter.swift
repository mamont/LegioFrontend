//
//  RootRouter.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RootRouterProtocol: class {
	func showAuth()
}

class RootRouter: BaseRouter {
		
}

extension RootRouter: RootRouterProtocol {
	
	func showAuth() {
		let controller = UIStoryboard(name: "Auth", bundle: nil)
			.instantiateViewController(withIdentifier: AuthView.storyboardIdentifier)
		self.show(controller)
	}
}
