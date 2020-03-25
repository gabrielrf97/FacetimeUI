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
    var printIcon: PrintIcon!

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .systemGray
        setupView()
    }
    
    func createElements() {
        controllsView = ControllsView()
        controllsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controllsView)
        
        smallViewLayer = UIView()
        smallViewLayer.backgroundColor = .yellow
        smallViewLayer.layer.cornerRadius = 6.0
        smallViewLayer.layer.masksToBounds = true
        smallViewLayer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(smallViewLayer)
        
        printIcon = PrintIcon()
        printIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(printIcon)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            controllsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            controllsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            controllsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            controllsView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            smallViewLayer.heightAnchor.constraint(equalToConstant: view.frame.height/8),
            smallViewLayer.widthAnchor.constraint(equalToConstant: view.frame.width/5.8),
            smallViewLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            smallViewLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            printIcon.heightAnchor.constraint(equalToConstant: 60),
            printIcon.widthAnchor.constraint(equalTo: printIcon.heightAnchor),
            printIcon.bottomAnchor.constraint(equalTo: controllsView.topAnchor, constant: -18),
            printIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    func additionalSetup() {
        printIcon.setRadius()
    }
    
}
