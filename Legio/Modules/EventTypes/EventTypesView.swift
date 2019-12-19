//
//  EventTypesView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol EventTypesViewProtocol: class {
    func updateData()
}

class EventTypesView: UIViewController {
	
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let headerIdentifier: String = "HeaderInterestCell"
//    private let cellIdentifier: String = "InterestCell"
    
    var presenter: EventTypesPresenterProtocol!
    
	
	override func viewDidLoad() {
		super.viewDidLoad()
        configureUI()
        self.presenter.viewDidLoad()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar(state: .onlyBackButton)
    }
	
}

extension EventTypesView: EventTypesViewProtocol {
    
    internal func updateData() {
        collectionView.reloadData()
    }
    
}

extension EventTypesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let interest: Interest = self.presenter.getInterest(for: indexPath.row)
//        if interest.isOpened && interest.subInterests.count > 0 {
//            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? InterestCell {
//                cell.labelName.text = interest.name
//                cell.subInterests = interest.subInterests
//                return cell
//            }
//        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerIdentifier, for: indexPath) as? HeaderInterestCell {
                cell.labelName.text = interest.name
                let selectedCount = interest.isOpened
                    ? 1
                    : 0//interest.getSelectedSubinterestsCount()
                cell.updateSelected(count: selectedCount)
                cell.updateCell(width: interest.cellWidth)
                return cell
            }
//        }
        let cell = UICollectionViewCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.presenter.set(contentWidth: self.view.frame.width - 10)
        return self.presenter.getCellSize(for: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        self.presenter.didSelectInterest(at: indexPath.row)
////        collectionView.reloadItems(at: [indexPath])
        
//        let indexPathes = collectionView.indexPathsForVisibleItems
//        collectionView.reloadItems(at: indexPathes)
    }
    
}


extension EventTypesView {
    
    private func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeaderInterestCell.self, forCellWithReuseIdentifier: headerIdentifier)
//        collectionView.register(InterestCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
}


//MARK: - Actions
extension EventTypesView {
	
	@IBAction func buttonNextTapped(_ sender: Any) {
		
	}
	
}
