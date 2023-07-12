//
//  ARViewModel.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//


import Foundation
import RealityKit
import ARKit
import Vision
import SwiftUI


class ARViewModel: UIViewController, ObservableObject, ARSessionDelegate {
    @Published private var model : ARModel = ARModel()
    @ObservedObject var settings =  Settings.shared
    
    
    
    let handModel = try! HandPoseClassifierComplete(configuration: MLModelConfiguration())
    
    var frameCount: Int = 0
    
    var arView : ARView {
        model.arView
    }
    
    var handTilt: Float {
        model.handTilt
    }
    
    var tiltLeft: Bool {
        if handTilt > 0.5 {
            return true
        } else {
            return false
        }
    }
    
    var tiltRight: Bool {
        if handTilt < -0.5 {
            return true
        } else {
            return false
        }
    }
    
    func startSessionDelegate() {
        model.arView.session.delegate = self
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        model.updateHeadTilt()
        frameCount += 1
        
        if frameCount % 5 == 0 {
            let pixelBuffer = frame.capturedImage
            
            let handPoseRequest = VNDetectHumanHandPoseRequest()
            handPoseRequest.maximumHandCount = 2
            handPoseRequest.revision = VNDetectHumanHandPoseRequestRevision1
            
            let request = VNDetectHumanBodyPoseRequest()
            
            let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
            
            do {
                try handler.perform([request, handPoseRequest])
            } catch {
                assertionFailure("Human Pose Request Failed: \(error)")
            }
            
            
            if let handPoses = handPoseRequest.results,
               !handPoses.isEmpty,
               let handObservation = handPoses.first,
               frameCount % Int(handObservation.confidence) == 0 {
                
                guard let keypointsMultiArray = try? handObservation.keypointsMultiArray() else { fatalError() }
                
                do{
                    let handPosePrediction = try handModel.prediction(poses: keypointsMultiArray)
                    let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label]!
                    
                    if confidence > 0.8 {
                        print("\(handPosePrediction.label)")
                        settings.result = handPosePrediction.label
                    }
                    
                } catch {
                    print(error)
                }
        }
        
            
            
        }
        
    }
    
    func endSession(){
        model.pauseSession()
    }
    
    func beginSession(){
        model.restartSession()
    }

}
