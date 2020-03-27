//
//  ControlsView.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit

protocol EffectsViewProtocol: class {
    func hideEffectsView()
    func showEffectsView()
}

class ControllsView: UIView, ViewCode {
    
    var viewActionIndicator: UIView!
    var iconsStackView: CallButtonsStackView!
    var blurredView: UIView!
    var scrollView: UIScrollView!
    var effectsCollectionView: UICollectionView!
    let collectionViewFlow = UICollectionViewFlowLayout()
    
    var isShowingEffectsView = false
    weak var effectsDelegate: EffectsViewProtocol?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createElements() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120))
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        configureScrollView()
        addSubview(scrollView)
        
        blurredView = UIView()
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        blurredView.bounds = self.bounds
        blurredView.layer.masksToBounds = true
        blurredView.backgroundColor = .appDarkGray
        self.sendSubviewToBack(blurredView)
        addSubview(blurredView)
        
        viewActionIndicator = UIView()
        viewActionIndicator.backgroundColor = .appLightGray
        viewActionIndicator.translatesAutoresizingMaskIntoConstraints = false
        viewActionIndicator.layer.masksToBounds = true
        viewActionIndicator.layer.cornerRadius = 2
        addSubview(viewActionIndicator)
        
        effectsCollectionView = UICollectionView(frame: CGRect(x: UIScreen.main.bounds.width,
                                                               y: 0,
                                                               width: UIScreen.main.bounds.width,
                                                               height: scrollView.frame.height),
                                                collectionViewLayout: collectionViewFlow)
        effectsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionViewFlow.scrollDirection = .horizontal
        effectsCollectionView.delegate = self
        effectsCollectionView.dataSource = self
        effectsCollectionView.register(EffectTypeCell.self, forCellWithReuseIdentifier: EffectTypeCell.identifier)
        effectsCollectionView.backgroundColor = .clear
        scrollView.addSubview(effectsCollectionView)
        
        iconsStackView = CallButtonsStackView()
        iconsStackView.backgroundColor = .blue
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(iconsStackView)
    }
    
    func setupConstraints() {
        viewActionIndicator.width(30).height(4).top(8).centerHorizontally()
        scrollView.leading(0).trailing(0).bottom(20).top(20)
        iconsStackView.width(UIScreen.main.bounds.width).height(120).centerVertically()
    }
    
    func configureScrollView() {
        let contentWidth = UIScreen.main.bounds.width * 2
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.height)
    }
    
    func additionalSetup() {
        layer.cornerRadius = 16.0
        layer.masksToBounds = true
        backgroundColor = .appDarkGray
//        self.alpha = 0.7
        createTapTarget()
    }
    
    func createTapTarget() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selfTapped))
        self.addGestureRecognizer(tap)
    }
    
    @objc func selfTapped() {
        isShowingEffectsView ? hideEffectsView() : showEffectsView()
        isShowingEffectsView = !isShowingEffectsView
    }
    
    func hideEffectsView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewActionIndicator.alpha = 1.0
        })
        scrollView.scrollRectToVisible(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100), animated: true)
        effectsDelegate?.hideEffectsView()
    }
    
    func showEffectsView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.viewActionIndicator.alpha = 0.0
        })
        scrollView.scrollRectToVisible(CGRect(x: UIScreen.main.bounds.width, y: 0, width: UIScreen.main.bounds.width, height: 100), animated: true)
        effectsDelegate?.showEffectsView()
    }
}

extension ControllsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EffectTypeCell.identifier, for: indexPath) as? EffectTypeCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .appLightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: collectionView.frame.width / 2 - 50, bottom: 0, right: collectionView.frame.width / 2 - 50)
    }

}
