//
//  TileMapLoader.swift
//  InstancedRendering
//
//  Created by Todd Martin on 5/20/24.
//

import Foundation
import simd

public class TileMapLoader {
    
    /// Load a CSV tile map
    /// - Parameter mapName: Name of the CSV file in bundle
    /// - Parameter startId: Id to start with for entity Ids
    /// - Parameter textureName : name of the texture to use
    static func loadCsvTileMapToQuadTextures(mapName: String, startId: Int32, textureName: String) -> [RenderableQuadTexture] {
        var entities = [RenderableQuadTexture]()
        var contents: String
        var startId = startId
        
        // load in file
        guard let path = Bundle.main.path(forResource: mapName, ofType: "csv") else {
            return entities
        }
        
         // read in contents of file
        do {
            contents = try String(contentsOfFile: path)
        } catch {
            return entities
        }
        
        // split by newline character
        let rows = contents.components(separatedBy: "\n")
        var rowPointer = Float(rows.count / 2)
        
        for row in rows {
            if row.isEmpty {
                break
            }
            
            let columns = row.components(separatedBy: ",")
            var columnPointer = Float(columns.count / 2) * -1
            for index in columns {
                guard let id = Int(index) else {
                    fatalError("Could not cast id to an integer")
                }

                let quadTexture = RenderableQuadTexture()
                quadTexture.setTextureById(id, textureName: textureName)
                entities.append(quadTexture)
                  
                startId += 1
                columnPointer += 1
            }
            rowPointer -= 1
        }
        
        
        return entities
    }
}
