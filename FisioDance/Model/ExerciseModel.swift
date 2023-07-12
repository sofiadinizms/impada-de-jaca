//
//  exercise.swift
//  cameraApp
//
//  Created by sofiadinizms on 09/04/23.
//

import Foundation
import UIKit

public struct Exercise: Identifiable {
    let name: Int
    let duration: Int
    var position: CGFloat
    let offImage: UIImage
    let onImage: String
    public var id: Int { name }
}
