//
//  RenderableQuadTexture.swift
//  Flatland
//
//  Created by Todd Martin on 5/21/24
//

import simd

public class RenderableQuadTexture: Entity {
    public var textureCoordinates: simd_float4x2? = nil
    public var parent: Entity? = nil
    public var children: [Entity] = [Entity]()

    public func setTextureById(_ id: Int, textureName: String) {
        guard let texture = TextureLibrary.shared.getTexture(textureName) else {
            fatalError("Failed to set texture by id")
        }

        self.textureCoordinates = texture.getTileCoordinatesById(id: id)
    }

    public func setTextureByLocation(row: Int, column: Int, textureName: String) {
        guard let texture = TextureLibrary.shared.getTexture(textureName) else {
            fatalError("Failed to set texture by location")
        }

        self.textureCoordinates = texture.getTileCoordiantesByLocation(row: Float(row), column: Float(column))
    }
}
