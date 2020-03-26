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
        
        cameraView = UIView()
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraView)
        
        controllsView = ControllsView()
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
        cameraView.bottom(0).leading(0).trailing(0).top(0)
        controllsView.bottom(0).leading(0).right(0).top(600)
        
        NSLayoutConstraint.activate([
            smallCameraLayer.heightAnchor.constraint(equalToConstant: view.frame.height/7),
            smallCameraLayer.widthAnchor.constraint(equalToConstant: view.frame.width/5),
            smallCameraLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            smallCameraLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            printButton.heightAnchor.constraint(equalToConstant: 60),
            printButton.widthAnchor.constraint(equalTo: printButton.heightAnchor),
            printButton.bottomAnchor.constraint(equalTo: controllsView.topAnchor, constant: -18),
            printButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    func additionalSetup() {

    }
    
}
