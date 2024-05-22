//
//  GenericNode.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

public class GenericNode: Entity {
    public var parent: (any Entity)? = nil
    public var children: [any Entity] = [Entity]()
}
