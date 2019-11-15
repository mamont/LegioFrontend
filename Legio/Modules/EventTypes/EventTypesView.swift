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
//    func errorData()
//    func updateButtonLogin(isEnabled: Bool)
//    func updateLoginAlert(isHidden: Bool)
//    func updateLoginProgressBar(progress: Float)
//    func updateLoginSuccess(image: UIImage?)
//    func updatePasswordAlert(isHidden: Bool)
//    func updatePasswordProgressBar(progress: Float)
//    func updatePasswordSuccess(image: UIImage?)
}

class EventTypesView: UIViewController {
	
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let headerIdentifier: String = "HeaderInterestCell"
    private let cellIdentifier: String = "InterestCell"
    
    var presenter: EventTypesPresenterProtocol!
    
    
    
    private var interestCell: InterestCell? = nil
    private var headerInterestCell: HeaderInterestDefaultCell? = nil
	
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
        let interest: Interest = interests[indexPath.row]
        if interest.isOpened && interest.subInterests.count > 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? InterestCell {
                cell.labelName.text = interest.name
                cell.subInterests = interest.subInterests
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerIdentifier, for: indexPath) as? HeaderInterestCell {
                cell.labelName.text = interest.name
                let selectedCount = interest.isOpened
                    ? 1
                    : interest.getSelectedSubinterestsCount()
                cell.updateSelected(count: selectedCount)
                cell.updateCell(width: interest.cellWidth)
                return cell
            }
        }
        let cell = UICollectionViewCell()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.presenter.getCellSize(for: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        interests[indexPath.row].isOpened = !interests[indexPath.row].isOpened
////        collectionView.reloadItems(at: [indexPath])
        collectionView.reloadData()
//        let indexPathes = collectionView.indexPathsForVisibleItems
//        collectionView.reloadItems(at: indexPathes)
    }
    
}


extension EventTypesView {
    
    private func configureUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(HeaderInterestCell.self, forCellWithReuseIdentifier: headerIdentifier)
        collectionView.register(InterestCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
    
}


//MARK: - Actions
extension EventTypesView {
	
	@IBAction func buttonNextTapped(_ sender: Any) {
		
	}
	
}
