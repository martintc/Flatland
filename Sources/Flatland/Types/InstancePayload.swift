//
//  InstancePayload.swift
//  Flatland
//
//  Created by Todd Martin on 5/10/24.
//

import Foundation
import simd

public struct InstancePayload {
    public var model: simd_float4x4
    public var textureCoordinates: simd_float4x2

    public init(model: simd_float4x4, textureCoordinates: simd_float4x2) {
        self.model = model
        self.textureCoordinates = textureCoordinates
    }
}
