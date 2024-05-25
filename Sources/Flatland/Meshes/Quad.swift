//
//  Quad.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import simd

public class Quad {

    /// Get the vertices of a quad
    public static func getVertices() -> [simd_float3] {
        return [
          simd_float3(-0.5,  0.5, 0),
          simd_float3(-0.5, -0.5, 0),
          simd_float3( 0.5,  0.5, 0),
          simd_float3( 0.5, -0.5, 0)
        ]
    }

    /// Get the indices of a quad
    public static func getIndices() -> [ushort] {
        return [
          0, 1, 2,
          2, 3, 0
        ]
    }
}
