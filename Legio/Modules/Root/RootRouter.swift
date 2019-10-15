//
//  RootRouter.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RootRouterProtocol: class {
	func showLoginMain()
}

class RootRouter: BaseRouter {
	
}

extension RootRouter: RootRouterProtocol {
    
    func showLoginMain() {
        guard let controller = UIStoryboard(name: "LoginMain", bundle: nil)
			.instantiateViewController(withIdentifier:  LoginMainView.storyboardIdentifier) as? LoginMainView else {
				return
		}
		let assembler: LoginMainAssemblerProtocol = LoginMainAssembler()
		assembler.assemble(with: controller)
        self.show(controller)
    }
    
}
