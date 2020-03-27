//
//  CallViewController.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import UIKit
import Stevia
import AVFoundation

class CallViewController: UIViewController, ViewCode {

    var cameraView: UIView!
    var smallCameraLayer: UIView!
    var controllsView: ControllsView!
    var effectsView: EffectsView!
    var printButton: PrintButton!
    
    var session: AVCaptureSession!
    var output: AVCaptureMetadataOutput?
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var backSession: AVCaptureSession!
    var backDevice: AVCaptureDevice?
    var backInput: AVCaptureDeviceInput?
    var backOutput: AVCaptureMetadataOutput?
    var backPreviewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view = UIView(frame: UIScreen.main.bounds)
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        CameraLayer.createCamera(in: cameraView)
        setupCamera()
    }
    
    func createElements() {
        
        effectsView = EffectsView()
        effectsView.translatesAutoresizingMaskIntoConstraints = false
        effectsView.clipsToBounds = false
        view.addSubview(effectsView)
        view.sendSubviewToBack(effectsView)
        
        cameraView = UIView()
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraView)
        
        controllsView = ControllsView()
        controllsView.effectsDelegate = self
        controllsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controllsView)
        
        smallCameraLayer = UIView()
        smallCameraLayer.backgroundColor = .appWhite
        smallCameraLayer.layer.cornerRadius = 6.0
        smallCameraLayer.layer.masksToBounds = true
        smallCameraLayer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(smallCameraLayer)
        
        printButton = PrintButton(in: self.view)
        printButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(printButton)
    }
    
    func setupCamera() {
        session = AVCaptureSession()
        session.sessionPreset = .hd4K3840x2160

        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
            let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }

        session.addInput(input)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        previewLayer.zPosition = -1
        self.cameraView.layer.addSublayer(previewLayer)
        session?.startRunning()
    }
    
    func setupConstraints() {
        effectsView.bottom(0).leading(0).right(0).height(160)
        cameraView.bottom(0).leading(0).trailing(0).top(0)
        controllsView.bottom(0).leading(0).right(0).height(160)
        
        NSLayoutConstraint.activate([
            smallCameraLayer.heightAnchor.constraint(equalToConstant: view.frame.height/7),
            smallCameraLayer.widthAnchor.constraint(equalToConstant: view.frame.width/5),
            smallCameraLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            smallCameraLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            printButton.heightAnchor.constraint(equalToConstant: 60),
            printButton.widthAnchor.constraint(equalTo: printButton.heightAnchor),
            printButton.bottomAnchor.constraint(equalTo: effectsView.topAnchor, constant: -18),
            printButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    func additionalSetup() {
        smallCameraLayer.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(smallViewDragged(_:))))
    }
    
    @objc func smallViewDragged(_ gestureRecognizer: UIPanGestureRecognizer) {
        let translation = gestureRecognizer.translation(in: smallCameraLayer)
        smallCameraLayer.frame.origin.x += translation.x
        smallCameraLayer.frame.origin.y += translation.y
        gestureRecognizer.setTranslation(.zero, in: smallCameraLayer)
        if gestureRecognizer.state == .ended {
            repositionateView()
        }
    }
    
    func repositionateView() {
        let xPosition = smallCameraLayer.frame.midX
        let yPosition = smallCameraLayer.frame.midY
        
        var newX: CGFloat = 0.0
        var newY: CGFloat = 0.0
        
        if xPosition < UIScreen.main.bounds.midX {
            newX = 12
        } else {
            newX = UIScreen.main.bounds.width - 12 - self.smallCameraLayer.frame.width
        }
        
        if yPosition < UIScreen.main.bounds.midY {
            newY = 12 + 40 //TODO: Refactorare so it works resposivelly
        } else {
            newY = UIScreen.main.bounds.height - 12 - self.smallCameraLayer.frame.height - controllsView.heightConstraint!.constant
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.smallCameraLayer.frame.origin = CGPoint(x: newX, y: newY)
            self.smallCameraLayer.updateConstraintsIfNeeded()
        })
    }
}

extension CallViewController: EffectsViewProtocol {
    func hideEffectsView() {
        self.effectsView.heightConstraint?.constant -= 60
        self.effectsView.hideCollectionView()
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func showEffectsView() {
        self.effectsView.heightConstraint?.constant += 60
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.effectsView.showCollectionView()
        })
    }
}
