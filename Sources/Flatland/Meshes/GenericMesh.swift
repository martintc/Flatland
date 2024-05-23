//
//  GenericMesh.swift
//  Flatland
//
// Created by Todd Martin on 5/22/24
//

import MetalKit

class GenericMesh: Mesh {
    var vertexBuffer: (any MTLBuffer)?
    var vertexCount: Int
    var indexCount: Int
    var indexBuffer: (any MTLBuffer)?

    required init() {
        self.vertexCount = 0
        self.indexCount = 0
        self.indexBuffer = nil
        self.vertexBuffer = nil
    }
    
    init(vertexBuffer: any MTLBuffer,
         vertexCount: Int,
         indexBuffer: any MTLBuffer,
         indexCount: Int) {
        self.vertexCount = vertexCount
        self.indexBuffer = indexBuffer
        self.vertexBuffer = vertexBuffer
        self.indexCount = indexCount
    }
}
