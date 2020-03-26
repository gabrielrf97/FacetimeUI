//
//  Icon.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

enum IconType {
    case effects
    case mute
    case turnCamera
    case turnOff
    
    func getDefaultColor() -> UIColor {
        switch self {
        case .turnOff:
            return .appRed
        default:
            return .appLightGray
        }
    }

    func getActiveColor() -> UIColor {
        return .appWhite
    }
    
    func getTintColor(for state: Bool) -> UIColor {
        if state {
            return .appBlack
        } else {
            return .appWhite
        }
    }
    
    func getIconImage() -> UIImage {
        switch self {
        case .turnCamera:
            return UIImage(systemName: "camera.rotate")!
        case .mute:
            return UIImage(systemName: "mic.slash.fill")!
        case .effects:
            return UIImage(systemName: "wand.and.stars.inverse")!
        case .turnOff:
            return UIImage(systemName: "xmark")!
        }
    }
    
    func canBeActive() -> Bool {
        switch self {
        case .turnCamera:
            return false
        case .mute:
            return true
        case .effects:
            return true
        case .turnOff:
            return false
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .turnOff:
            return "desligar"
        case .effects:
            return "efeitos"
        case .mute:
            return "mudo"
        case .turnCamera:
            return "virar"
        }
    }
    
}

private enum LayoutConstraints: CGFloat {
    case buttonHeight = 60
    case labelHeight = 18
}

class Icon: UIView, ViewCode {
    
    var iconButton: UIButton!
    var iconLabel: UILabel!
    
    var type: IconType!
    var isActive: Bool! {
        didSet {
            iconButton.backgroundColor = isActive ? type.getActiveColor() : type.getDefaultColor()
            iconButton.imageView?.tintColor = type.getTintColor(for: isActive)
        }
    }
    
    init(frame: CGRect = .zero, type: IconType) {
        super.init(frame: frame)
        self.isActive = false
        self.type = type
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboard usage")
    }
    
    func createElements() {
        iconButton = UIButton()
        iconButton.setImage(type.getIconImage(), for: .normal)
        iconButton.imageView?.tintColor = type.getTintColor(for: isActive)
        iconButton.backgroundColor = type.getDefaultColor()
        iconButton.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        iconButton.addGestureRecognizer(tap)
        addSubview(iconButton)
        
        iconLabel = UILabel()
        iconLabel.font = UIFont.systemFont(ofSize: 12)
        iconLabel.text = type.getTitle()
        iconLabel.textAlignment = .center
        iconLabel.textColor = .appWhite
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconButton.heightAnchor.constraint(equalToConstant: LayoutConstraints.buttonHeight.rawValue),
            iconButton.widthAnchor.constraint(equalTo: iconButton.heightAnchor, multiplier: 1),
            iconButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: iconButton.bottomAnchor, constant: 2),
            iconLabel.leadingAnchor.constraint(equalTo: iconButton.leadingAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: iconButton.trailingAnchor),
            iconLabel.heightAnchor.constraint(equalToConstant: 20),
            iconLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func additionalSetup() {
        iconButton.layer.cornerRadius = 30
        iconButton.imageView?.image = type.getIconImage()
        iconButton.layer.masksToBounds = true
    }
    
    @objc func tapped() {
        if type.canBeActive() {
            self.isActive = !isActive
        }
        //TODO: Perform types Action
    }
}
