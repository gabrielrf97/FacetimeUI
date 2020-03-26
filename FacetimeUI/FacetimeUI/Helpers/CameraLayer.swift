//
//  CameraLayer.swift
//  FacetimeUI
//
//  Created by Gabriel Faria on 3/26/20.
//  Copyright © 2020 Gabriel Rodrigues. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class CameraLayer: UIViewController {
    static var session: AVCaptureSession!
    static var previewLayer: AVCaptureVideoPreviewLayer!
    static var input: AVCaptureDeviceInput!
    
    static func createCamera(in view: UIView) {
        session = AVCaptureSession()
        session.sessionPreset = .medium

        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
            let input = try? AVCaptureDeviceInput(device: device) else {
            return
        }
        self.input = input
        session.addInput(input)
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.connection?.videoOrientation = .portrait
        view.layer.addSublayer(previewLayer)
        
        session?.startRunning()
    }
    
    static func captureImage() {
        let stillImageOutput = AVCapturePhotoOutput()
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .auto
        
        if self.input.device.isFlashAvailable {
            photoSettings.flashMode = .auto
        }

        if let firstAvailablePreviewPhotoPixelFormatTypes = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
            photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: firstAvailablePreviewPhotoPixelFormatTypes]
        }
        
        if let videoConnection = stillImageOutput.connection(with: .video) {
//            stillImageOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
}

extension CameraLayer: AVCapturePhotoCaptureDelegate {
    
//    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
//
//        if let error = error {
//            print("Error capturing photo: \(error)")
//        } else {
//            if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
//
//                if let image = UIImage(data: dataImage) {
////                    self.capturedImage.image = image
//                }
//            }
//        }
//    }
//
//    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
//
//        guard let data = photo.fileDataRepresentation(),
//              let image =  UIImage(data: data)  else {
//                return
//        }
//
//    }
}
