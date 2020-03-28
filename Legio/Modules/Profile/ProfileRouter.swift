//
//  ProfileRouter.swift
//  Legio
//
//  Created by MIkkyMouse on 31/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol ProfileRouterProtocol: class {
    func showStatic()
    func showPreset()
    func showEvent()
}

class ProfileRouter: BaseRouter {
    
}

extension ProfileRouter: ProfileRouterProtocol {
    
    func showStatic() {
        // no active
    }
    
    func showPreset() {
        let controller = UIStoryboard(name: "Preset", bundle: nil)
            .instantiateViewController(withIdentifier: PresetView.storyboardIdentifier)
        self.show(controller)
    }
    
    func showEvent() {
        guard let controller = UIStoryboard(name: "EventTypes", bundle: nil)
            .instantiateViewController(withIdentifier: EventTypesView.storyboardIdentifier) as? EventTypesView else { return }
        let assembler: EventTypesAssemblerProtocol = EventTypesAssembler()
        assembler.assemble(with: controller)
        self.show(controller)
    }
    
    
}
