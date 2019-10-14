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
    func showVkontakte()
    func showFacebook()
    func showRegister()
}

class RootRouter: BaseRouter {
		
}

extension RootRouter: RootRouterProtocol {
    
    func showRegister() {
        let controller = UIStoryboard(name: "Register", bundle: nil)
            .instantiateViewController(withIdentifier: RegisterView.storyboardIdentifier)
        self.show(controller)
    }
    
    func showVkontakte() {
       print("nil")
    }
    
    func showFacebook() {
         print("nil")
    }
    
	
	func showAuth() {
		let controller = UIStoryboard(name: "Auth", bundle: nil)
			.instantiateViewController(withIdentifier: AuthView.storyboardIdentifier)
		self.show(controller)
	}
    
    
    
}
