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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		router = ForgotRouter(controller: self)
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar(state: .onlyBackButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupReturnToPreviousViewController()
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
