//
//  EventTypesPresenter.swift
//  Legio
//
//  Created by Mac on 09.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesPresenterProtocol {
    var itemsCount: Int { get }
    func viewDidLoad()
    func set(contentWidth: CGFloat)
    func getCellSize(for row: Int) -> CGSize
//    func EventTypesTapped()
//    func changed(login: String?)
//    func changed(password: String?)
}

class EventTypesPresenter {
    
    weak var view: EventTypesViewProtocol?
    var router: EventTypesRouterProtocol!
    var interactor: EventTypesInteractorProtocol!
    
    private var contentWidth: CGFloat = 0
    private var interests: [Interest] = []
   
}

extension EventTypesPresenter: EventTypesPresenterProtocol {
    
    internal var itemsCount: Int {
        return interests.count
    }
    
    internal func viewDidLoad() {
        self.interactor.getInterestList { [weak self] interests in
            guard let self = self else { return }
            self.interests = interests
            self.view?.updateData()
        }
    }
    
    internal func set(contentWidth: CGFloat) {
        self.contentWidth = contentWidth
    }
    
    internal func getCellSize(for row: Int) -> CGSize {
        var cellHeight: CGFloat = 50
        var cellWidth: CGFloat = 30
        
        let interest: Interest = interests[row]
        if interest.isOpened && interest.subInterests.count > 0 {
            cellWidth = self.view.frame.width
            
            interestCell = InterestCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 600))
            interestCell?.labelName.text = interest.name
            interestCell?.subInterests = interest.subInterests
            
            interestCell?.contentView.layoutIfNeeded()
            cellHeight = 70 + (interestCell?.interestsCollectionView.contentSize.height ?? 300)
            print("cellHeight = \(cellHeight)")
        } else {
            headerInterestCell = HeaderInterestDefaultCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 600))
            headerInterestCell?.labelName.text = interest.name
            let widthMaximum = (self.view.frame.width / 2) - 2
            
            headerInterestCell?.contentView.layoutIfNeeded()
            
            let cellMainWidth = (headerInterestCell?.viewMain.frame.width ?? widthMaximum) + 20
            cellWidth = cellMainWidth > widthMaximum
                ? widthMaximum
                : cellMainWidth
            
            interests[indexPath.row].cellWidth = cellWidth
        }
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

extension EventTypesPresenter {
    
//    private func EventTypes(email: String, password: String) {
//        // progress hud load
//        interactor.EventTypes(email: email, password: password) { [weak self] (userData, error) in
//            // self?. progress hud finish load
//            /*
//            if let userData = userData {
//                //do something with data
//                self.router.showSingIn()
//            } else {
//                let errorText = error?.localizedDescription ?? "some network error"
//            }
//            */
//            self?.router.showSingIn()
//        }
//    }
//    
//    private func updateLoginViews(isValidated: Bool) {
//        let shownImage = getValidImage(isValidated: isValidated)
//        view?.updateLoginSuccess(image: shownImage)
//    }
//    
//    private func showLoginError(isCorrect: Bool) {
//        view?.updateLoginAlert(isHidden: isCorrect)
//        
//        let validateProgress = getProgress(isValidated: isCorrect)
//        view?.updateLoginProgressBar(progress: validateProgress)
//    }
//    
//    private func updatePasswordViews(isValidated: Bool) {
//        let shownImage = getValidImage(isValidated: isValidated)
//        view?.updatePasswordSuccess(image: shownImage)
//    }
//    
//    private func showPasswordError(isCorrect: Bool) {
//        view?.updatePasswordAlert(isHidden: isCorrect)
//        
//        let validateProgress = getProgress(isValidated: isCorrect)
//        view?.updatePasswordProgressBar(progress: validateProgress)
//    }
//    
//    private func getProgress(isValidated: Bool) -> Float {
//        return isValidated
//            ? 0.0
//            : 1.0
//    }
//    
//    private func getValidImage(isValidated: Bool) -> UIImage? {
//        return isValidated
//            ? validImage
//            : nil
//    }
//    
//    private func isCorrectData() -> Bool {
//        guard self.login != nil ,
//            self.password != nil else {
//                return false
//        }
//        return true
//    }
}

