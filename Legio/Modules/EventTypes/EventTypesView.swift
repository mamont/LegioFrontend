//
//  EventTypesView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesViewProtocol {
	
}

class EventTypesView: UIViewController {
	
	var router: EventTypesRouterProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		router = EventTypesRouter(controller: self)
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar(state: .onlyBackButton)
    }
	
}

//MARK: - Actions
extension EventTypesView {
	
	@IBAction func buttonNextTapped(_ sender: Any) {
		router?.showMain()
	}
	
}
