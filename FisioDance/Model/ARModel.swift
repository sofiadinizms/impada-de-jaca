//
//  ARModel.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//


import Foundation
import RealityKit
import ARKit

struct ARModel {
    private(set) var arView : ARView
    
    var handTilt: Float = 0
    
    init() {
        
        arView = ARView(frame: .zero)
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
    mutating func updateHeadTilt() {
        
        let handAnchor = arView.scene.anchors.first(where: {$0.name == "handAnchor" })
        let cameraAnchor = arView.scene.anchors.first(where: {$0.name == "cameraAnchor" })
        
        handTilt = handAnchor?.orientation(relativeTo: cameraAnchor).axis.z ?? 0
    }
    
    func pauseSession(){
        for anchor in arView.scene.anchors {
            arView.scene.removeAnchor(anchor)
        }
        
        arView.session.pause()
        arView.removeFromSuperview()
        
    }
    
    func restartSession(){
        arView.session.run(ARFaceTrackingConfiguration())
    }
    
}

