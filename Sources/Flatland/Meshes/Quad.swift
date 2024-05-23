//
//  Quad.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import simd

public final class Quad {
    public var verticies: [simd_float3] {
        return [
          simd_float3(-0.5,  0.5, 0),
          simd_float3(-0.5, -0.5, 0),
          simd_float3( 0.5,  0.5, 0),
          simd_float3( 0.5, -0.5, 0)
        ]
    }

    public var indicies: [ushort] {
        return [
          0, 1, 2,
          2, 3, 0
        ]
    }
}
