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
		//router?.showAuth()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        router?.showRegister()
    }
    
    
    @IBAction func facebookButton(_ sender: Any) {
        plugsAlert(title: "This feature is not available yet")
    }
    
    @IBAction func vkontakteButton(_ sender: UIButton) {
        plugsAlert(title: "This feature is not available yet")
    }
    
    
    @IBAction func authButton(_ sender: UIButton) {
        router?.showAuth()
    }
}

extension RootView: RootViewProtocol {
    
}
