//
//  TextureLoader.swift
//  Flatland
//
// Created by Todd Martin on 5/21/25
//

import Foundation
import Metal
import MetalKit

public class TextureLoader {
    
    static let shared = TextureLoader()
    
    private var loader: MTKTextureLoader
    
    init() {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Issue creating default device in TextureLoader")
        }
        
        self.loader = MTKTextureLoader(device: device)
    }

    /// Load a MTLTexture
    /// - Parameter sourceName: Name of the file for a texture to be loaded
    func loadTexture(sourceName: String) -> MTLTexture? {
        do {
            let texture = try self.loader.newTexture(name: sourceName,
                                                     scaleFactor: 1.0,
                                                     bundle: Bundle.main,
                                                     options: [MTKTextureLoader.Option.textureStorageMode: 0])
            
            return texture
        } catch let error {
            print("Error: \(error)")
        }
        
        return nil
    }
}
