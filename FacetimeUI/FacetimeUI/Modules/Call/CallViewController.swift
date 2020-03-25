//
//  CallViewController.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit

class CallViewController: UIViewController, ViewCode {

    var videoLayer: UIView!
    var smallViewLayer: UIView!
    var controllsView: ControllsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func createElements() {
        controllsView = ControllsView()
        view.addSubview(controllsView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            controllsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            controllsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controllsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controllsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
    }
    
    func additionalSetup() {
        
    }
    
}
