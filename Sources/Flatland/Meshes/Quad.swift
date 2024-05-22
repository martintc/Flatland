//
//  Quad.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import MetalKit
import simd

public final class Quad: Mesh {
    var vertexBuffer: (any MTLBuffer)?
    var vertexCount: Int
    var indexCount: Int
    var indexBuffer: (any MTLBuffer)?

    init() {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Could not create default device in Quad")
        }
        
        let vertices: [SimpleVertex] = [
            SimpleVertex(vertex: simd_float3(-0.5, -0.5, 0)),
            SimpleVertex(vertex: simd_float3(-0.5, 0.5, 0)),
            SimpleVertex(vertex: simd_float3(0.5, 0.5, 0)),
            SimpleVertex(vertex: simd_float3(0.5, -0.5, 0)),
        ]
        
        let indices: [ushort] = [
            0, 1, 2,
            2, 3, 0
        ]
        
        guard let vb = device.makeBuffer(bytes: vertices, 
                                         length: vertices.count * MemoryLayout<SimpleVertex>.stride) else {
            fatalError("Could not create vertex buffer for quad")
        }
        
        guard let ib = device.makeBuffer(bytes: indices, 
                                         length: MemoryLayout.stride(ofValue: indices[0]) * indices.count,
                                         options: MTLResourceOptions.storageModeShared) else {
            fatalError("Could not make index buffer")
        }
        
        self.vertexBuffer = vb
        self.vertexCount = vertices.count
                
        self.indexBuffer = ib
        self.indexCount = indices.count
    }
}
