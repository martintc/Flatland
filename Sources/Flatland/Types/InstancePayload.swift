//
//  InstancePayload.swift
//  Flatland
//
//  Created by Todd Martin on 5/10/24.
//

import Foundation
import simd

public struct InstancePayload {
    var model: simd_float4x4
    var textureCoordinates: simd_float4x2
}
