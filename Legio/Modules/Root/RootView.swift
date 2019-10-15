//
//  RootView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol RootViewProtocol: class {
	
}

class RootView: UIViewController {
	
	private let assembler: RootAssemblerProtocol = RootAssembler()
	var presenter: RootPresenterProtocol!
	
	override func viewDidLoad() {
		super.viewDidLoad()
        assembler.assemble(with: self)
		presenter.viewDidLoad()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
}

extension RootView: RootViewProtocol {
    
}
