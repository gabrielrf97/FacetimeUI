//
//  PrintIcon.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class PrintIcon: UIView, ViewCode {
    
    var innerView: UIView!
    
    override var bounds: CGRect {
        didSet {
            self.setRadius()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        innerView = UIView()
        innerView.backgroundColor = .appWhite
        innerView.layer.borderColor = UIColor.appBlack.cgColor
        innerView.layer.borderWidth = 2
        innerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(innerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            innerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            innerView.heightAnchor.constraint(equalTo: innerView.widthAnchor),
            innerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            innerView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
    
    func setRadius() {
        layer.cornerRadius = 30
        layer.masksToBounds = true
        innerView.layer.cornerRadius = 25
        innerView.layer.masksToBounds = true
    }
    
}

class PrintButton: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setBackgroundImage(UIImage(named: "printButton"), for: .normal)
    }
    
}
