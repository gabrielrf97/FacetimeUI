//
//  CameraView.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/25/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraView: UIView {
    
    var session: AVCaptureSession!
    var output: AVCaptureMetadataOutput?
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    func loadCamera() {
        session = AVCaptureSession()
        session.sessionPreset = .medium

        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
            let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        
        session.addInput(input)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame.size = CGSize(width: 100, height: 140)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        self.layer.addSublayer(previewLayer)
        
        session?.startRunning()
    }

}
