//
//  Forgot.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol ForgotViewProtocol {
	
}

class ForgotView: UIViewController {
	
	@IBOutlet weak var textFieldLogin: UITextField!
	
	var router: ForgotRouterProtocol?
	private let titleText = "Forgot"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = titleText
		router = ForgotRouter(controller: self)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
}

//MARK: - Actions
extension ForgotView {
	
	@IBAction func buttonSingInTapped(_ sender: Any) {
		router?.showForgot()
	}
	
}
