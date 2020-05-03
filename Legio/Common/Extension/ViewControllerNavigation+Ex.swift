//
//  ViewControllerNavigation+Ex.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

// Протокол для объектов, имеющих идентификатор в сториборде
protocol StoryboardIdentifiable {
	static var storyboardIdentifier: String { get }
}

enum NavigationBarState {
    case hide
    case onlyBackButton
    case show
}

extension UIViewController {
    
    internal func configureNavigationBar(state: NavigationBarState) {
        switch state {
        case .hide:
            self.navigationController?.navigationBar.isHidden = true
        
        case .show:
            self.navigationController?.navigationBar.isHidden = false
        
        case .onlyBackButton:
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.topItem?.title = ""
        }
    }
    
    // TO DO: Придумать решение лучше
    internal func setupReturnToPreviousViewController() {
        guard let previousViewController = self.navigationController?.previousViewController() else {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            return
        }
        if previousViewController.isKind(of: RootView.self) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            return
        }
        
        if previousViewController.isKind(of: AuthView.self) && !(self.navigationController?.visibleViewController?.isKind(of: RegisterView.self))! {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            return
        }
        
        if previousViewController.isKind(of: RegisterView.self) {
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            return
        }
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

}

extension UINavigationController {
    
    ///Get previous view controller of the navigation stack
    func previousViewController() -> UIViewController? {
        
        let lenght = self.viewControllers.count
        
        let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
        
        return previousViewController
    }
    
}

// Расширение UIViewController,
// которое даёт совместимость с протоколом StoryboardIdentifiable
extension UIViewController: StoryboardIdentifiable { }

// Расширение протокола StoryboardIdentifiable для UIViewController,
// создающее идентификатор в сториборде, равный названию класса контроллера
extension StoryboardIdentifiable where Self: UIViewController {
	
	static var storyboardIdentifier: String {
		return String(describing: self)
	}
}

extension UIStoryboard {
	
	func instantiateViewController<T: UIViewController>(_: T.Type) -> T {
		guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
			fatalError("View controller с идентификатором \(T.storyboardIdentifier) не найден")
		}
		
		return viewController
	}
	
	func instantiateViewController<T: UIViewController>() -> T {
		guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
			fatalError("View controller с идентификатором \(T.storyboardIdentifier) не найден")
		}
		
		return viewController
	}
}
