//
//  PrintIcon.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

class PrintButton: UIButton {
    
    var rootView: UIView!
    
    init(frame: CGRect = .zero, in view: UIView) {
        super.init(frame: frame)
        self.rootView = view
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setBackgroundImage(UIImage(named: "printButton"), for: .normal)
        addTarget(self, action: #selector(takeScreenShot), for: .touchUpInside)
    }
    
    @objc func takeScreenShot() {
        let size = UIScreen.main.bounds.size
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            rootView.layer.render(in: context)
        }
        if let printedImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIImageWriteToSavedPhotosAlbum(printedImage, nil, nil, nil)
        }
        UIGraphicsEndImageContext()
    
    }
    
}
