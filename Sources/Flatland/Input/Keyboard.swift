//
//  Keyboard.swift
//  Flatland
//
//  Created by Todd Martin on 7/8/24
//

public class Keyboard {
    
    private static var KEY_COUNT: Int = 256
    private static var keys = [Bool].init(repeating: false,
                                         count: KEY_COUNT)
    
    public static func setKeyPressed(_ keyCode: UInt16,
                                     isOn: Bool) {
        keys[Int(keyCode)] = isOn
    }
    
    public static func isKeyPressed(_ keyCode: Keycodes) -> Bool {
        keys[Int(keyCode.rawValue)]
    }
}
