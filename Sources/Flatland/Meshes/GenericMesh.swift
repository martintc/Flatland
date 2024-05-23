//
//  GenericMesh.swift
//  Flatland
//
// Created by Todd Martin on 5/22/24
//

import MetalKit

public class GenericMesh: Mesh {
    public var vertexBuffer: (any MTLBuffer)?
    public var vertexCount: Int
    public var indexCount: Int
    public var indexBuffer: (any MTLBuffer)?

    public required init() {
        self.vertexCount = 0
        self.indexCount = 0
        self.indexBuffer = nil
        self.vertexBuffer = nil
    }
    
    public init(vertexBuffer: any MTLBuffer,
         vertexCount: Int,
         indexBuffer: any MTLBuffer,
         indexCount: Int) {
        self.vertexCount = vertexCount
        self.indexBuffer = indexBuffer
        self.vertexBuffer = vertexBuffer
        self.indexCount = indexCount
    }
}
