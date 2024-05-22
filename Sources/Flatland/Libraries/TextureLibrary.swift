//
//  TextureLibrary.swift
//
//  Created by Todd Martin on 5/14/24.
//

import Foundation
import MetalKit

public class TextureLibrary {
    static let shared = TextureLibrary()
    
    private var library: [String: Texture]
    
    init() {
        self.library = [String: Texture]()
    }

    /// Retrieve a texture from the library
    /// Parameter textureName: Name of the texture to get from library
    func getTexture(_ textureName: String) -> Texture? {
        guard let texture = self.library[textureName] else {
            return nil
        }
        
        return texture
    }

    /// Load a tile atlas or tilesheet into the libraru
    /// - Parameter sourceName: Name of the tilesheet file
    /// - Parameter textureName: Name of the texture to use as key for library
    /// - Parameter spriteWidth: Width of sprites in tilesheet
    /// - Parameter spriteHeight: Height of the sprite in the tilesheet
    func loadTileAtlasIntoLibrary(sourceName: String, textureName: String, spriteWidth: Float, spriteHeight: Float) -> Bool {
        if sourceName.isEmpty || textureName.isEmpty {
            return false
        }
        
        guard let mtlTexture = TextureLoader.shared.loadTexture(sourceName: sourceName) else {
            return false
        }
        
        let texture = Texture(texture: mtlTexture, spriteWidth: spriteWidth, spriteHeight: spriteHeight)
        
        self.library[textureName] = texture
        
        return true
    }

    /// Load a texture into the library
    /// - Parameter sourceName: Name of the tilesheet file
    /// - Parameter textureName: Name of the texture to use as key for library
    func loadTextureIntoLibrary(sourceName: String, textureName: String) -> Bool {
        if sourceName.isEmpty || textureName.isEmpty {
            return false
        }
        
        guard let mtlTexture = TextureLoader.shared.loadTexture(sourceName: sourceName) else {
            return false
        }
        
        let texture = Texture(texture: mtlTexture)
        
        self.library[textureName] = texture
        
        return true
    }
}
