//
//  Box2D.swift
//  Flatland
//
//  Created by Todd Martin on 5/23/24
//

public class Box2D: Component {
    var x: Float
    var y: Float
    var width: Float
    var height: Float

    public init(x: Float, y: Float, width: Float, height: Float) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }
}
