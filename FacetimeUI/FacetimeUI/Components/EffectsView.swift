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
    var flowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        flowLayout.scrollDirection = .horizontal
        effectsColletionView = UICollectionView(frame: CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 50), collectionViewLayout: flowLayout)
        effectsColletionView.delegate = self
        effectsColletionView.dataSource = self
        effectsColletionView.isScrollEnabled = true
        effectsColletionView.backgroundColor = .clear
        effectsColletionView.register(EffectTypeCell.self, forCellWithReuseIdentifier: EffectTypeCell.identifier)
        addSubview(effectsColletionView)
    }
    
    func setupConstraints() {
        effectsColletionView.top(10).leading(0).trailing(0).height(40)
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EffectTypeCell.identifier, for: indexPath) as? EffectTypeCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension EffectsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
    }
}

