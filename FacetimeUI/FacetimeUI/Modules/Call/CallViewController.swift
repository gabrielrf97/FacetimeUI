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
    var smallCameraLayer: CameraView!
    var controllsView: ControllsView!
    var printIcon: PrintIcon!
    
    var session: AVCaptureSession!
    var device: AVCaptureDevice?
    var input: AVCaptureDeviceInput?
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
        smallCameraLayer.loadCamera()
    }
    
    func createElements() {
        
        cameraView = CameraView()
        cameraView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cameraView)
        
        controllsView = ControllsView()
        controllsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controllsView)
        
        smallCameraLayer = CameraView()
        smallCameraLayer.backgroundColor = .yellow
        smallCameraLayer.layer.cornerRadius = 6.0
        smallCameraLayer.layer.masksToBounds = true
        smallCameraLayer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(smallCameraLayer)
        
        printIcon = PrintIcon()
        printIcon.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(printIcon)
    }
    
    func setupCamera() {
        session = AVCaptureSession()
        session.sessionPreset = .hd4K3840x2160

        guard let _device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
            let _input = try? AVCaptureDeviceInput(device: _device) else {
            return
        }
        input = _input
        device = _device
        session.addInput(_input)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame.size = CGSize(width: view.frame.width/5, height: view.frame.height/7)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        previewLayer.zPosition = -1
        self.smallCameraLayer.layer.addSublayer(previewLayer)
        
        session?.startRunning()
    }
        
    func setupConstraints() {
        cameraView.bottom(0).leading(0).trailing(0).top(0)
        controllsView.bottom(0).leading(0).right(0).height(200)
        
        NSLayoutConstraint.activate([
            smallCameraLayer.heightAnchor.constraint(equalToConstant: view.frame.height/7),
            smallCameraLayer.widthAnchor.constraint(equalToConstant: view.frame.width/5),
            smallCameraLayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
            smallCameraLayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
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
