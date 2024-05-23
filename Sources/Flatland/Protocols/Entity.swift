//
//  Entity.swift
//  Flatland
//
//  Created by Todd Martin on 5/10/24.
//

public protocol Entity {
    var parent: Entity? { get set }
    var children: [Entity] { get set }
}

extension Entity {
    public mutating func addChild(_ entity: inout any Entity) {
        entity.setParent(self)
        children.append(entity)
    }

    public mutating func setParent(_ entity: any Entity) {
        parent = entity
    }
}
