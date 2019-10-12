//
//  Auth.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol AuthViewProtocol {
	
}

class AuthView: UIViewController {
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!
	
	private let titleText = "Auth"
	
	var router: AuthRouterProtocol?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = titleText
		router = AuthRouter(controller: self)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
}

//MARK: - Actions
extension AuthView {
	
	@IBAction func buttonSingInTapped(_ sender: Any) {
		authUser()
	}
	
	@IBAction func buttonForgotTapped(_ sender: Any) {
        plugsAlert(title: "This feature is not available yet")
        //router?.showForgot()
	}
	
	@IBAction func buttonRegisterTapped(_ sender: Any) {
		router?.showRegister()
	}
	
}
