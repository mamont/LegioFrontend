//
//  InterestCell.swift
//  Legio
//
//  Created by Mac on 10.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

class InterestCell: UICollectionViewCell {
//    
//    
//    private let cellIdentifier: String = "SubInterestCell"
//    
//    var subInterests: [Interest] = [] {
//        didSet {
//            interestsCollectionView.reloadData()
//        }
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let viewMain: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.legio.legioBlue
//        view.layer.cornerRadius = 20
//        view.layer.borderColor = UIColor.init(red: 233/255, green: 237/255, blue: 255/255, alpha: 1).cgColor
//        view.layer.borderWidth = 2
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    let labelName: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textAlignment = .center
//        label.textColor = UIColor.white
//        return label
//    }()
//    
//    let viewHeart: UIImageView = {
//        let view = UIImageView()
//        view.backgroundColor = UIColor.clear
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFit
//        view.image = UIImage(named: "heart")
//        return view
//    }()
//    
//    let labelSelectedCount: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.textAlignment = .center
//        label.textColor = UIColor.white
//        return label
//    }()
//    
//    let interestsCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = UIColor.legio.legioBlue
//        collectionView.isScrollEnabled = false
//        return collectionView
//    }()
//    
//    let buttonClose: UIButton = {
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = UIColor.clear
//        let image = UIImage(named: "close")
//        button.setImage(image, for: .normal)
//        return button
//    }()
//    
//    
//    private func setupViews() {
//        self.contentView.addSubview(viewMain)
//        viewMain.addSubview(labelName)
//        self.contentView.addSubview(viewHeart)
//        self.contentView.addSubview(labelSelectedCount)
//        self.contentView.addSubview(interestsCollectionView)
//        self.contentView.addSubview(buttonClose)
//        interestsCollectionView.delegate = self
//        interestsCollectionView.dataSource = self
//        interestsCollectionView.register(SubInterestCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        self.updateSelectedSubinterestsCount()
//        activateConstraints()
//    }
//    
//    private func activateConstraints() {
//        NSLayoutConstraint.activate([
//            self.viewMain.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 0),
//            self.viewMain.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//            self.viewMain.heightAnchor.constraint(equalToConstant: 40),
//            
//            self.viewHeart.topAnchor.constraint(equalTo: self.viewMain.topAnchor, constant: -8),
//            self.viewHeart.rightAnchor.constraint(equalTo: self.viewMain.rightAnchor, constant: 14),
//            self.viewHeart.heightAnchor.constraint(equalToConstant: 30),
//            self.viewHeart.widthAnchor.constraint(equalToConstant: 30),
//            
//            self.labelSelectedCount.centerXAnchor.constraint(equalTo: self.viewHeart.centerXAnchor, constant: 0),
//            self.labelSelectedCount.centerYAnchor.constraint(equalTo: self.viewHeart.centerYAnchor, constant: -2),
//            self.labelSelectedCount.heightAnchor.constraint(equalToConstant: 30),
//            self.labelSelectedCount.widthAnchor.constraint(equalToConstant: 30),
//            
//            self.labelName.leftAnchor.constraint(equalTo: self.viewMain.leftAnchor, constant: 10),
//            self.labelName.rightAnchor.constraint(equalTo: self.viewMain.rightAnchor, constant: -10),
//            self.labelName.topAnchor.constraint(equalTo: self.viewMain.topAnchor, constant: 0),
//            self.labelName.bottomAnchor.constraint(equalTo: self.viewMain.bottomAnchor, constant: 0),
//            
//            self.interestsCollectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0),
//            self.interestsCollectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0),
//            self.interestsCollectionView.topAnchor.constraint(equalTo: self.viewMain.bottomAnchor, constant: 10),
//            self.interestsCollectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
//            
//            self.buttonClose.rightAnchor.constraint(equalTo: self.interestsCollectionView.rightAnchor, constant: -4),
//            self.buttonClose.topAnchor.constraint(equalTo: self.interestsCollectionView.topAnchor, constant: 4),
//            self.buttonClose.heightAnchor.constraint(equalToConstant: 14),
//            self.buttonClose.widthAnchor.constraint(equalToConstant: 14)
//        ])
//    }
//    
//    private func updateSelectedSubinterestsCount() {
//        let selectedCount: Int = subInterests.filter({$0.isOpened}).count
//        let selectedText = selectedCount > 0
//        ? "\(selectedCount)"
//        : ""
//        labelSelectedCount.text = selectedText
//    }
//    
//}
//
//extension InterestCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return subInterests.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SubInterestCell {
//            cell.labelName.text = subInterests[indexPath.row].name
//            cell.set(isSelected: subInterests[indexPath.row].isOpened)
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellHeight: CGFloat = 50
//        var cellWidth: CGFloat = 80
//        
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? SubInterestCell {
//            let subInterest = subInterests[indexPath.row]
//            cell.labelName.text = subInterest.name
//            cell.contentView.layoutIfNeeded()
//            cellWidth = cell.viewMain.frame.width + 16
//        }
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        interestsCollectionView.deselectItem(at: indexPath, animated: false)
//        subInterests[indexPath.row].isOpened = !subInterests[indexPath.row].isOpened
//        interestsCollectionView.reloadItems(at: [indexPath])
//        updateSelectedSubinterestsCount()
//    }
//    
}

