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
        viewActionIndicator.backgroundColor = .white
        viewActionIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewActionIndicator.layer.masksToBounds = true
        viewActionIndicator.layer.cornerRadius = 2
        addSubview(viewActionIndicator)
        
        iconsStackView = UIStackView()
        iconsStackView.backgroundColor = .green
//        iconsStackView.alignment = .fill
//        iconsStackView.distribution = .fill
        iconsStackView.axis = .horizontal
        iconsStackView.spacing = 10
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconsStackView)
        
//        effectsIcon = Icon(type: .effects)
//        effectsIcon.translatesAutoresizingMaskIntoConstraints = false
//        effectsIcon.backgroundColor = .red
//        addSubview(effectsIcon)
//
//        muteIcon = Icon(type: .mute)
//        muteIcon.translatesAutoresizingMaskIntoConstraints = false
//        muteIcon.backgroundColor = .green
//        addSubview(muteIcon)
//
//        turnCameraIcon = Icon(type: .turnCamera)
//        turnCameraIcon.translatesAutoresizingMaskIntoConstraints = false
//        turnCameraIcon.backgroundColor = .orange
//        addSubview(turnCameraIcon)
//
//        turnOffIcon = Icon(type: .turnOff)
//        turnOffIcon.translatesAutoresizingMaskIntoConstraints = false
//        turnOffIcon.backgroundColor = .brown
//        addSubview(turnOffIcon)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            viewActionIndicator.widthAnchor.constraint(equalToConstant: 30),
            viewActionIndicator.heightAnchor.constraint(equalToConstant: 4),
            viewActionIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            viewActionIndicator.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        iconsStackView.left(0).right(0).centerVertically().height(100)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(view)
        view.backgroundColor = .red
        
        let view_ = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
       view_.translatesAutoresizingMaskIntoConstraints = false
       iconsStackView.addArrangedSubview(view_)
       view_.backgroundColor = .green
        
        let _view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        _view.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(_view)
        _view.backgroundColor = .yellow
        
        let aview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        aview.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.addArrangedSubview(aview)
        aview.backgroundColor = .red
        
//        NSLayoutConstraint.activate([
//            iconsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            iconsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            iconsStackView.topAnchor.constraint(equalTo: viewActionIndicator.bottomAnchor, constant: 16),
//            iconsStackView.heightAnchor.constraint(equalToConstant: 200),
//            iconsStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
//        ])
        
//        NSLayoutConstraint.activate([
//            effectsIcon.heightAnchor.constraint(equalToConstant: 55),
//            effectsIcon.widthAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            effectsIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            effectsIcon.topAnchor.constraint(equalTo: topAnchor, constant: 35)
//        ])
//
//        NSLayoutConstraint.activate([
//            muteIcon.heightAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            muteIcon.widthAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            muteIcon.leadingAnchor.constraint(equalTo: effectsIcon.trailingAnchor, constant: 20),
//            muteIcon.topAnchor.constraint(equalTo: effectsIcon.topAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            turnCameraIcon.heightAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            turnCameraIcon.widthAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            turnCameraIcon.leadingAnchor.constraint(equalTo: muteIcon.trailingAnchor, constant: 20),
//            turnCameraIcon.topAnchor.constraint(equalTo: effectsIcon.topAnchor)
//        ])
//
//        NSLayoutConstraint.activate([
//            turnOffIcon.heightAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            turnOffIcon.widthAnchor.constraint(equalTo: effectsIcon.heightAnchor),
//            turnOffIcon.leadingAnchor.constraint(equalTo: turnCameraIcon.trailingAnchor, constant: 20),
//            turnOffIcon.topAnchor.constraint(equalTo: effectsIcon.topAnchor)
//        ])

    
    }
    
    func additionalSetup() {
//        setRoundCorners([.topLeft,.topRight], radius: 8.0)
        configureGaussianBlur()
        backgroundColor = .darkGray
    }
    
    func configureGaussianBlur() {
        
    }
}
