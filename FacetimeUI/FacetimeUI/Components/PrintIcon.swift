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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.borderColor = UIColor.black.cgColor
        innerView.layer.borderWidth = 1.5
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
