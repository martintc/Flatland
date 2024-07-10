//
//  MetalLibrary.swift
//  Flatland
//
// Created by Todd Martin on 7/10/24
//

import Metal

public class MetalLibrary {
    public static let shared = MetalLibrary()

    private var library: MTLLibrary? = nil
    private var functions: [String: any MTLFunction] = [String: any MTLFunction]()

    /// Create a library
    /// - Parameter device: MTLDevice to create a default library from
    public func createLibrary(device: MTLDevice) {
        library = device.makeDefaultLibrary()
    }

    /// Make a function by name and add it to the library
    /// - Parameter name: Name of the function to load
    public func makeFunction(name: String) {
        functions[name] = library?.makeFunction(name: name)
    }

    /// Get a function from the library if present
    /// - Parameter name: Name of the function to get
    public func getFunction(name: String) -> (any MTLFunction)? {
        functions[name]
    }
}
