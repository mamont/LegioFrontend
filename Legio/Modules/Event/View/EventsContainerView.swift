//
//  EventsContainerView.swift
//  Legio
//
//  Created by Mac on 28.03.2020.
//  Copyright © 2020 Марат Нургалиев. All rights reserved.
//

import UIKit

private enum AnimateDirection {
    case left
    case right
}

class EventsContainerView: UIView {
    
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configure(viewModels: [EventViewModel]) {
        
        for viewModel in viewModels {
            let eventCardView = EventCardView(frame: bounds)
            self.addSubview(eventCardView)
            eventCardView.configure(viewModel: viewModel)
            
        }
        let emptyCardView = EmptyEventCardView(frame: bounds)
        self.insertSubview(emptyCardView, at: 0)
        self.layoutIfNeeded()
    }
    
    func likeHandled() {
        prepareChangeEvent(direction: .left)
    }
    
    func dislikeHandled() {
        prepareChangeEvent(direction: .right)
    }
    
    
    //MARK: - Private funcs
    
    private func prepareChangeEvent(direction: AnimateDirection) {
        guard let subview = subviews.last,
            subviews.count > 1 else {
                return
        }
        animateChangeSubview(
            view: subview,
            direction: direction)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(self.nibName, owner: self, options: nil)
    }
    
    private func animateChangeSubview(
        view: UIView,
        direction: AnimateDirection) {
           
           let endXPosition: CGFloat = direction == .left
               ? -frame.width
               : frame.width
           
           UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseIn,
            animations: {
                   
                   view.frame = CGRect(
                       x: endXPosition,
                       y: view.frame.origin.y,
                       width: view.frame.width,
                       height: view.frame.height)
           }, completion: { _ in
               view.removeFromSuperview()
           })
           
       }
}
