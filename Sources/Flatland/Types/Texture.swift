//
//  Texture.swift
//  Flatland
//
//  Created by Todd Martin on 5/14/24.
//

import Foundation
import MetalKit
import simd

public class Texture {
    public var texture: MTLTexture
    var rows: Float = 0
    var columns: Float = 0
    
    var totalSprites: Int {
        return Int(columns * rows)
    }

    /// Initialize a texture with only a texture
    public init(texture: MTLTexture) {
        self.texture = texture
    }
    
    /// Initialzie a texture given a texture and a sprite width and height
    /// this initializer assumed all sprite are the same width and height
    /// - Parameter texture: Metal Texture
    /// - Parameter spriteWidth: Width in pixels of a sprite
    /// - Parameter spriteHeight: Height in pixels of a sprite
    public init(texture: MTLTexture, spriteWidth: Float, spriteHeight: Float) {
        self.texture = texture
        rows = Float(texture.height) / spriteHeight
        columns = Float(texture.width) / spriteWidth
    }

    /// Get the texture coordinates of a sprite within a tilesheet
    /// - Parameter row: Row that a sprite lives on
    /// - Parameter column: Column that a sprite lives on
    public func getTileCoordiantesByLocation(row: Float, column: Float) -> simd_float4x2 {
        var coordinates = simd_float4x2()
        
        if rows == 0 || columns == 0 {
            return coordinates
        }
        
        if row < 0 || row > rows {
            return coordinates
        }
        
        if column < 0 || column > columns {
            return coordinates
        }
        
        let leftEdge: simd_float1 = Float(column / columns)
        let topEdge: simd_float1 = Float(row / rows)
        let rightEdge: simd_float1 = Float((column + 1) / columns)
        let bottomEdge: simd_float1 = Float((row + 1) / rows)
        
        coordinates[0] = simd_float2(leftEdge, bottomEdge)
        coordinates[1] = simd_float2(leftEdge, topEdge)
        coordinates[2] = simd_float2(rightEdge, topEdge)
        coordinates[3] = simd_float2(rightEdge, bottomEdge)
        
        return coordinates
    }
    
    /// Get the texture coordinates for a sprite based on a texture id from a csv tile map
    /// - Parameter id: Identifier of sprite from csv tilemap
    public func getTileCoordinatesById(id: Int) -> simd_float4x2 {
        if id < 0 {
            return simd_float4x2()
        }
        
        if id > totalSprites {
            return simd_float4x2()
        }
        
        if rows == 0 && columns == 0 {
            return simd_float4x2()
        }
        
        let id = Float(id)
        
        let row = (id / columns).rounded(.down)
        let column = id.truncatingRemainder(dividingBy: columns)
        
        return getTileCoordiantesByLocation(row: row, column: column)
    }
}
