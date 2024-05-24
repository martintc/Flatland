//
//  Entity.swift
//  Flatland
//
//  Created by Todd Martin on 5/23/24
//

public class Entity {
    var id: Int
    var components: [String: Component] = [String: Component]()

    public init(id: Int) {
        self.id = id
    }

    public func addComponent(_ type: String, component: any Component) {
        self.components[type] = component
    }

    public func getComponent(_ type: String) -> (any Component)? {
        return self.components[type]
    }

    public func containsComponent(_ type: String) -> Bool {
        return self.components.contains(where: { $0.key == type })
    }

    public func removeComponent(_ type: String) {
        self.components.removeValue(forKey: type)
    }
}
