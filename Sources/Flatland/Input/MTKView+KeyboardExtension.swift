//
//  MTKView+KeyboardExtension.swift
//  Flatland
//
//  Created by Todd Martin on 7/8/24
//

import MetalKit

extension MTKView {
    open override var acceptsFirstResponder: Bool { return true }
    
    open override func keyDown(with event: NSEvent) {
        Keyboard.setKeyPressed(event.keyCode, isOn: true)
    }
    
    open override func keyUp(with event: NSEvent) {
        Keyboard.setKeyPressed(event.keyCode, isOn: false)
    }
}
