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
    var blurredView: UIView!
    
    var isShowingEffectsView = false
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        
        blurredView = UIView()
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        blurredView.bounds = self.bounds
        blurredView.layer.masksToBounds = true
        blurredView.backgroundColor = .appDarkGray
        self.sendSubviewToBack(blurredView)
        addSubview(blurredView)
        
        viewActionIndicator = UIView()
        viewActionIndicator.backgroundColor = .appLightGray
        viewActionIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewActionIndicator.layer.masksToBounds = true
        viewActionIndicator.layer.cornerRadius = 2
        addSubview(viewActionIndicator)
        
        iconsStackView = UIStackView()
        iconsStackView.distribution = .fillProportionally
        iconsStackView.alignment = .center
        iconsStackView.axis = .horizontal
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconsStackView)
        
        effectsIcon = Icon(type: .effects)
        effectsIcon.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(effectsIcon)

        muteIcon = Icon(type: .mute)
        muteIcon.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(muteIcon)

        turnCameraIcon = Icon(type: .turnCamera)
        turnCameraIcon.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(turnCameraIcon)

        turnOffIcon = Icon(type: .turnOff)
        turnOffIcon.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(turnOffIcon)
    }
    
    func setupConstraints() {
        blurredView.leading(0).trailing(0).top(0).bottom(0)
        viewActionIndicator.width(30).height(4).top(4).centerHorizontally()
        iconsStackView.left(20).right(20).bottom(0).height(100)
        effectsIcon.height(200).width(100)
        muteIcon.height(200).width(100)
        turnCameraIcon.height(200).width(100)
        turnOffIcon.height(200).width(100)
    }
    
    func additionalSetup() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        blurredView.blurView()
        backgroundColor = .appDarkGray
        self.alpha = 0.7
        createTapTarget()
    }
    
    func createTapTarget() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selfTapped))
        self.addGestureRecognizer(tap)
    }
    
    @objc func selfTapped() {
        isShowingEffectsView ? hideEffectsView() : showEffectsView()
        isShowingEffectsView = !isShowingEffectsView
    }
    
    func hideEffectsView() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.topConstraint?.constant -= 50
            self.layoutIfNeeded()
        })
    }
    
    func showEffectsView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.topConstraint?.constant += 50
            self.layoutIfNeeded()
        })
    }
}
