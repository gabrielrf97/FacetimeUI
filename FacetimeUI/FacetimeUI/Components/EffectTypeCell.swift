//
//  EffectTypeCell.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit
import Stevia

class EffectTypeCell: UICollectionViewCell, ViewCode {
    
    var cellImageView: UIImageView?
    static let identifier = "EffectsTypeCell"
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    init(frame: CGRect = .zero, image: UIImage) {
        self.cellImageView = UIImageView(image: image)
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        return
    }
    
    func setupConstraints() {
        cellImageView?.leading(0).trailing(0).top(0).bottom(0)
    }
    
    func additionalSetup() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.appWhite.cgColor
        backgroundColor = .yellow
        layer.masksToBounds = true
        layer.cornerRadius = 6
    }
    
}
