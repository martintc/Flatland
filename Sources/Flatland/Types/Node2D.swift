//
//  Node2D.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import simd

public class Node2D: Entity {
    public var parent: Entity? = nil
    public var children: [Entity] = [Entity]()

    public var position: simd_float3 = simd_float3(0, 0, 0)
    public var scale: simd_float3 = simd_float3(1, 1, 1)
    
    public init(position: simd_float3) {
        self.position = position
    }

    public func getTransform() -> simd_float4x4 {
        var model = matrix_identity_float4x4

        var scaleMatrix = matrix_identity_float4x4
        scaleMatrix[0][0] = scale.x
        scaleMatrix[1][1] = scale.y
        scaleMatrix[2][2] = scale.z

        model = model * matrix4x4_translation(position.x, position.y, position.z)
        model = model * scaleMatrix
        
        return model
    }
}
