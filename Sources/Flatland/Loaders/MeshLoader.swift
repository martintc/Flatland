//
//  MeshLoader.swift
//  Flatland
//
//  Created by Todd Martin on 5/22/24
//

import simd
import Metal

class MeshLoader {
    static let shared = MeshLoader()

    func loadModel(vertices: [simd_float3], indicies: [ushort]) -> (any Mesh)? {
        guard let device = MTLCreateSystemDefaultDevice() else {
            return nil
        }
        
        guard let vb = device.makeBuffer(bytes: vertices,
                                         length: vertices.count * MemoryLayout<simd_float3>.stride) else {
            return nil
        }

        guard let ib = device.makeBuffer(bytes: indicies,
                                         length: indicies.count * MemoryLayout.stride(ofValue: indicies[0])) else {
            return nil
        }

        let mesh = GenericMesh(vertexBuffer: vb,
                               vertexCount: vertices.count,
                               indexBuffer: ib,
                               indexCount: indicies.count)

        return mesh
    }
}
