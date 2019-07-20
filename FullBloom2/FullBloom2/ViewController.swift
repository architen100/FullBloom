//
//  ViewController.swift
//  FullBloom2
//
//  Created by Archisha Majee on 7/20/19.
//  Copyright © 2019 Archisha Majee. All rights reserved.
//

import UIKit
import Vision
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate  {
    
    let session = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var takePhoto = false;
    
    let dataOutputQueue = DispatchQueue(
        label: "video data queue",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCaptureSession()
        session.startRunning()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func configureCaptureSession() {
        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            fatalError("Couldn't find camera")
        }
        
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            session.addInput(cameraInput)
        }
            
        catch {
            fatalError(error.localizedDescription)
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        
        videoOutput.setSampleBufferDelegate(self as AVCaptureVideoDataOutputSampleBufferDelegate, queue: dataOutputQueue)
        
        videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
        
        // Add the video output to the capture session
        session.addOutput(videoOutput)
        
        let videoConnection = videoOutput.connection(with: .video)
        
        videoConnection?.videoOrientation = .portrait
        // Configure the preview layer
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = view.bounds
        view.layer.insertSublayer(previewLayer, at: 0)
        
        let queue = DispatchQueue(label: "com.archishamajee.captureQueue")
        videoOutput.setSampleBufferDelegate(self, queue:queue)
    }
    
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        // get image from sample buffer
    }
}

