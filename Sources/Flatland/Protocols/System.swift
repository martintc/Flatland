//
//  System.swift
//  Flatland
//
//  Created by Todd Martin on 5/23/24
//

public protocol System {
    var entities: [Entity] { get set }
    
    func update()
}

public extension System {
    mutating func addEntity(_ entity: Entity) {
        self.entities.append(entity)
    }
}
