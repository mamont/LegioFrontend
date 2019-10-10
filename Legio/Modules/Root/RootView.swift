//
//  RootView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RootViewProtocol {
	
}

class RootView: UIViewController {
	
	var router: RootRouterProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		router = RootRouter(controller: self)
		router?.showAuth()
	}
}

extension RootView: RootViewProtocol {
	
}
