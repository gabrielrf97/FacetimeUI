//
//  EffectsView.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/27/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class EffectsView: UIView, ViewCode {
    
    var effectsColletionView: UICollectionView!
    let flowLayout = UICollectionViewLayout()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        effectsColletionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 120, height: 60), collectionViewLayout: flowLayout)
        effectsColletionView.translatesAutoresizingMaskIntoConstraints = false
        effectsColletionView.backgroundColor = .systemPink
        effectsColletionView.alpha = 0.0
        effectsColletionView.delegate = self
        effectsColletionView.dataSource = self
        effectsColletionView.register(EffectTypeCell.self, forCellWithReuseIdentifier: EffectTypeCell.identifier)
        addSubview(effectsColletionView)
    }
    
    func setupConstraints() {
        effectsColletionView.top(10).leading(0).trailing(0).height(45)
    }
    
    func additionalSetup() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        backgroundColor = .appDarkGray
    }
    
    func showCollectionView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.effectsColletionView.alpha = 1.0
        })
    }
    
    func hideCollectionView() {
        UIView.animate(withDuration: 0.2, animations: {
            self.effectsColletionView.alpha = 0.0
        })
    }
}

extension EffectsView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
}

extension EffectsView: UICollectionViewDelegateFlowLayout {
    @objc(collectionView:layout:sizeForItemAtIndexPath:)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 30, height: 10)
    }
}
