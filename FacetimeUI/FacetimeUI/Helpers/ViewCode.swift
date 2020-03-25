//
//  ViewCode.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation

protocol ViewCode {
    func setupView()
    func createElements()
    func setupConstraints()
    func additionalSetup()
}

extension ViewCode {
    func setupView() {
        createElements()
        setupConstraints()
        additionalSetup()
    }
}
