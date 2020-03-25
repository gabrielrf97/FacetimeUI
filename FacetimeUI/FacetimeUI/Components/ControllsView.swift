//
//  ControlsView.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class ControllsView: UIView, ViewCode {
    
    var viewActionIndicator: UIView!
    var iconsStackView: UIStackView!
    var effectsIcon: Icon!
    var muteIcon: Icon!
    var turnCameraIcon: Icon!
    var turnOffIcon: Icon!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        viewActionIndicator = UIView()
        viewActionIndicator.backgroundColor = .systemGray
        addSubview(viewActionIndicator)
        
        iconsStackView = UIStackView()
        iconsStackView.alignment = .fill
        addSubview(iconsStackView)
        
        effectsIcon = Icon(type: .effects)
        iconsStackView.addSubview(effectsIcon)
        
        muteIcon = Icon(type: .mute)
        iconsStackView.addSubview(muteIcon)
        
        turnCameraIcon = Icon(type: .turnCamera)
        iconsStackView.addSubview(turnCameraIcon)
        
        turnOffIcon = Icon(type: .turnOff)
        iconsStackView.addSubview(turnOffIcon)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            viewActionIndicator.widthAnchor.constraint(equalToConstant: 20),
            viewActionIndicator.heightAnchor.constraint(equalToConstant: 2),
            viewActionIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            viewActionIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            iconsStackView.topAnchor.constraint(equalTo: viewActionIndicator.bottomAnchor, constant: 16),
            iconsStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func additionalSetup() {
        setRoundCorners([.topLeft,.topRight], radius: 8.0)
        configureGaussianBlur()
        
    }
    
    func configureGaussianBlur() {
        
    }
}
