//
//  ViewController.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let chatVC = CallViewController()
        chatVC.modalPresentationStyle = .fullScreen
        self.present(chatVC, animated: true, completion: nil)
    }

    @IBAction func presentTapped(_ sender: Any) {
        
    }
    
}

