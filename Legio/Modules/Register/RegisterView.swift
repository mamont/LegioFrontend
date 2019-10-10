//
//  RegisterView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RegisterViewProtocol {
	
}

class RegisterView: UIViewController {
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!
	
	var router: RegisterRouterProtocol?
	private let titleText = "Register"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = titleText
		router = RegisterRouter(controller: self)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
}

//MARK: - Actions
extension RegisterView {
	
	@IBAction func buttonSingInTapped(_ sender: Any) {
		router?.showSingIn()
	}
	
}
