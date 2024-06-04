//
//  RenderSystem.swift
//  Flatland
//
//  Created by Todd Martin on 6/3/24
//

import Metal

protocol RenderSystem {
    func update(re: MTLRenderCommandEncoder)
}
