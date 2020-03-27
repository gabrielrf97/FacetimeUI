//
//  CallButtonsStackView.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit

class CallButtonsStackView: UIStackView, ViewCode {
    
    
    var effectsIcon: Icon!
    var muteIcon: Icon!
    var turnCameraIcon: Icon!
    var turnOffIcon: Icon!
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        effectsIcon = Icon(type: .effects)
        effectsIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(effectsIcon)

        muteIcon = Icon(type: .mute)
        muteIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(muteIcon)

        turnCameraIcon = Icon(type: .turnCamera)
        turnCameraIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(turnCameraIcon)

        turnOffIcon = Icon(type: .turnOff)
        turnOffIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addArrangedSubview(turnOffIcon)
    }
    
    func setupConstraints() {
        effectsIcon.height(200).width(100)
        muteIcon.height(200).width(100)
        turnCameraIcon.height(200).width(100)
        turnOffIcon.height(200).width(100)
    }
    
    func additionalSetup() {
        self.distribution = .fillProportionally
        self.alignment = .center
        self.axis = .horizontal
    }
}
