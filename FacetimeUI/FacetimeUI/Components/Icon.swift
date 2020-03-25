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
            return .systemRed
        default:
            return .systemGray
        }
    }

    func getActiveColor() -> UIColor {
        return .systemRed
    }
    
//    func getIcon() -> UIImage {
//        switch self {
//        case .effects:
//            return UIImage(imageLiteralResourceName: "camera.rotate")
//        case mute:
//            return UIImage(systemImage: "mic.slash.fill")
//        case turnCamera:
//            return UIImage(systemImage: "wand.and.stars.inverse")
//        case turnOff:
//            return UIImage(systemImage: "xmark")
//        }
//    }
}

fileprivate enum LayoutConstraints: CGFloat {
    case buttonHeight = 20
    case labelHeight = 18
}

class Icon: UIView, ViewCode {
    
    var iconButton: UIButton!
    var iconLabel: UILabel!
    
    var type: IconType!
    var isActive: Bool! {
        didSet {
            iconButton.backgroundColor = isActive ? type.getActiveColor() : type.getDefaultColor()
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
        iconButton.backgroundColor = type.getDefaultColor()
        addSubview(iconButton)
        
        iconLabel = UILabel()
        addSubview(iconLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconButton.heightAnchor.constraint(equalToConstant: LayoutConstraints.buttonHeight.rawValue),
            iconButton.widthAnchor.constraint(equalTo: iconButton.heightAnchor, multiplier: 1),
            iconButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconButton.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: iconButton.bottomAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: iconButton.leadingAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: iconButton.trailingAnchor),
            iconLabel.heightAnchor.constraint(equalToConstant: LayoutConstraints.labelHeight.rawValue)
        ])
    }
    
    func additionalSetup() {
        iconButton.layer.cornerRadius = iconButton.frame.height / 2
        iconButton.layer.masksToBounds = true
    }
    
    @objc func tapped() {
        self.isActive = !isActive
    }
}
