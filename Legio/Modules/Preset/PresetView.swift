//
//  PresetView.swift
//  Legio
//
//  Created by Марат Нургалиев on 10/10/2019.
//  Copyright © 2019 Марат Нургалиев. All rights reserved.
//

import UIKit

protocol PresetViewProtocol {
    func setupViews()
    func updateViews(preset: PresetEntity, font: UIFont)
}

class PresetView: UIViewController {
    
    @IBOutlet var nerdyPercent: UILabel!
    @IBOutlet var partyPercent: UILabel!
    @IBOutlet var presetSlider: PresetSlider!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet weak var partyImageView: UIImageView!
    @IBOutlet weak var nerbyImageView: UIImageView!
    
    @IBOutlet weak var partyImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nerbyImageViewHeightConstraint: NSLayoutConstraint!
    
    var presenter: PresetPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureNavigationBar(state: .onlyBackButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupReturnToPreviousViewController()
    }
    
    @IBAction func presetSliderAction(_ sender: Any) {
        
        guard presenter != nil else { return }
        
        let value = presetSlider.value
        presenter.updateData(percents: value.convertToPercent())
    }
    
}


//MARK: - Scale by percents

extension PresetView: PresetViewProtocol {
    
    func setupViews() {
        nextButton.clipsToBounds = true
        presetSlider.setThumbImage(UIImage(named:"OvalPreset"), for: .normal)
    }
    
    func updateViews(preset: PresetEntity, font: UIFont) {
        
        if (preset.typePreset == .Party) {
            partyPercent.font = font
            partyPercent.text = "\(preset.percent)%\nвеселее"
            partyImageViewHeightConstraint.constant = font.pointSize
            
        } else {
            nerdyPercent.font = font
            nerdyPercent.text = "\(preset.percent)%\nумнее"
            nerbyImageViewHeightConstraint.constant = font.pointSize
            
        }
    }
}


//MARK: - Actions

extension PresetView {
    
    @IBAction func buttonNextTapped(_ sender: Any) {
        presenter.setTimeInvestTapped()
    }
    
}
