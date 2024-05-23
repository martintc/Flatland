//
//  Quad.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import simd

public final class Quad {
    var vertices: [simd_float3]
    var indicies: [ushort]

    init() {
        vertices = [
          simd_float3(-0.5,  0.5, 0),
          simd_float3(-0.5, -0.5, 0),
          simd_float3( 0.5,  0.5, 0),
          simd_float3( 0.5, -0.5, 0)
        ]

        indicies = [
          0, 1, 2,
          2, 3, 0
        ]
    }
}
