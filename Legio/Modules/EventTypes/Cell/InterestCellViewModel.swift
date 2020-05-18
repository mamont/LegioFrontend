//
//  InterestCellViewModel.swift
//  Legio
//
//  Created by Mac on 10.11.2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

/// Модель интереса
struct InterestCellViewModel {
    
    private enum Constants {
        static let defaultCellWidth: CGFloat = 30
        static let defaultCellHeight: CGFloat = 44
        static let cellRightSpace: CGFloat = 2
    }
    
    /// Id интереса
    let id: Int
    
    /// Название интереса
    let name: String
    
    /// Выбран ли интерес
    var isSelected: Bool
    
    /// Размер ячейки
    let cellSize: CGSize
    
    init(id: Int, name: String, isSelected: Bool, containerWidth: CGFloat) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
        self.cellSize = InterestCellViewModel.configureCellSize(
            name: name,
            containerWidth: containerWidth)
    }
    
    private static func configureCellSize(
        name: String,
        containerWidth: CGFloat) -> CGSize {
        
        let maxCellWidth: CGFloat = (containerWidth / 4) - 2
        
        let cellHeight = Constants.defaultCellHeight
        var cellWidth = Constants.defaultCellWidth
        
        let interestCell = InterestDefaultCell(frame: .zero)
        
        interestCell.labelName.text = name
        interestCell.contentView.layoutIfNeeded()
        
        if (interestCell.viewMain.frame.width + Constants.cellRightSpace) < maxCellWidth {
            cellWidth = interestCell.viewMain.frame.width + Constants.cellRightSpace
        } else {
            cellWidth = maxCellWidth
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
 
