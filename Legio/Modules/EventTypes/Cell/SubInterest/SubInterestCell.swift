//
//  SubInterestCell.swift
//  Legio
//
//  Created by Mac on 10.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

class SubInterestCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let viewMain: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.init(red: 233/255, green: 237/255, blue: 255/255, alpha: 1).cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = UIColor.legio.legioBlue
        label.lineBreakMode = .byTruncatingMiddle
        return label
    }()
    
    public func set(isSelected: Bool) {
        labelName.textColor = isSelected
            ? UIColor.white
            : UIColor.legio.legioBlue
        viewMain.backgroundColor = isSelected
            ? UIColor.legio.legioBlue
            : UIColor.white
    }
    
}

extension SubInterestCell {
    
    private func setupViews() {
        self.contentView.addSubview(viewMain)
        viewMain.addSubview(labelName)
        activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            self.viewMain.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10),
            self.viewMain.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            self.viewMain.heightAnchor.constraint(equalToConstant: 40),
               
            self.labelName.leftAnchor.constraint(equalTo: self.viewMain.leftAnchor, constant: 16),
            self.labelName.rightAnchor.constraint(equalTo: self.viewMain.rightAnchor, constant: -16),
            self.labelName.topAnchor.constraint(equalTo: self.viewMain.topAnchor, constant: 0),
            self.labelName.bottomAnchor.constraint(equalTo: self.viewMain.bottomAnchor, constant: 0)
        ])
    }
    
}

