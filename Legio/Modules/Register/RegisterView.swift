//
//  RegisterView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RegisterViewProtocol: class {
	func show(error: String)
}

class RegisterView: UIViewController {
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPassword: UITextField!
	
	var presenter: RegisterPresenterProtocol!
	
	private let titleText = "Register"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureViews()
	}
	
    override func viewWillAppear(_ animated: Bool) {
        textFieldLogin.becomeFirstResponder()
    }
    
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
}

//MARK: - Actions
extension RegisterView {
	
	@IBAction func buttonSingInTapped(_ sender: Any) {
		presenter.registrateTapped(email: textFieldLogin.text,
							 password: textFieldPassword.text)
	}
	
}

extension RegisterView: RegisterViewProtocol {
	
	func show(error: String) {
		plugsAlert(title: error)
	}
}

extension RegisterView {
	
	private func configureViews() {
		self.navigationController?.navigationBar.isHidden = false
		self.navigationItem.title = titleText
	}
	
}
