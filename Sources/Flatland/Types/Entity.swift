//
//  Entity.swift
//  Flatland
//
//  Created by Todd Martin on 5/23/24
//

public class Entity {
    var id: Int
    var components: [String: Component] = [String: any Component]()

    public init(id: Int) {
        self.id = id
    }

    /// Add a component to an entity
    /// - Parameter type: String representation of a component type
    /// - Parameter component: Component to add
    public func addComponent(_ type: String, component: any Component) {
        self.components[type] = component
    }

    /// Get a component for an entity
    /// - Parameter type: String representation of component type
    /// - Returns: A component if it exists or nil
    public func getComponent(_ type: String) -> (any Component)? {
        return self.components[type]
    }

    /// Check to see if an entity has a particular component
    /// - Parameter type: String representation of a component type
    /// - Returns: True if entity has component, otherwise false
    public func containsComponent(_ type: String) -> Bool {
        return self.components.contains(where: { $0.key == type })
    }

    /// Remove a component from an entity
    /// - Parameter type: String representation of a component type
    public func removeComponent(_ type: String) {
        self.components.removeValue(forKey: type)
    }
}
