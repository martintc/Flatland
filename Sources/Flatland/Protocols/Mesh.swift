//
//  Mesh.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import MetalKit

public protocol Mesh {
    var vertexBuffer: MTLBuffer? { get set }
    var vertexCount: Int { get set }
    var indexCount: Int { get set }
    var indexBuffer: MTLBuffer? { get set }

    init()
}
