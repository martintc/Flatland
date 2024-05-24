//
//  OrthographicCamera.swift
//  Flatland
//
// Created by Todd Martin on 5/21/24
//

import Foundation
import simd

public class OrthographicCamera  {
    var id: Int32
    
    var position: simd_float3
    
    var scale: Float
    
    var texture: String?
    
    var textureCoordinates: simd_float4x2?
    
    var projectionMatrix: simd_float4x4 = matrix_identity_float4x4
    var viewMatrix: simd_float4x4 = matrix_identity_float4x4
    
    var rotation: simd_float1 = 0
    
    var aspectRatio: Float = 0

    public var parent: Entity? = nil
    
    required init() {
        self.id = 0
        self.position = simd_float3(0, 0, 0)
        self.scale = 1
    }
    
    init(left: Float, right: Float, bottom: Float, top: Float, near: Float, far: Float) {
        self.id = 0
        self.position = simd_float3(0, 0, 0)
        self.scale = 1
        
        projectionMatrix[0][0] = 2 / (right - left)
        projectionMatrix[0][1] = 0
        projectionMatrix[0][2] = 0
        projectionMatrix[0][3] = -(right + left) / (right - left)
        
        projectionMatrix[1][0] = 0
        projectionMatrix[1][1] = 2 / (top - bottom)
        projectionMatrix[1][2] = 0
        projectionMatrix[1][3] = -(top + bottom) / (top - bottom)
        
        projectionMatrix[2][0] = 0
        projectionMatrix[2][1] = 0
        projectionMatrix[2][2] = -2 / (far - near)
        projectionMatrix[2][3] = -(far + near) / (far - near)
        
        projectionMatrix[3][0] = 0
        projectionMatrix[3][1] = 0
        projectionMatrix[3][2] = 0
        projectionMatrix[3][3] = 1
    }

    /// Set rotation
    public func setRotation(by rotation: Float) {
        self.rotation = rotation
        recalculateViewMatrix()
    }

    /// Set position
    public func setPosition(to vector: simd_float3) {
        self.position = vector
        recalculateViewMatrix()
    }

    /// Get position
    public func getPosition() -> simd_float3 {
        self.position
    }

    /// Get rotation
    public func getRotation() -> Float {
        self.rotation
    }

    /// Recalculate the view matrix for camera
    private  func recalculateViewMatrix() {
        let transform: simd_float4x4 = matrix4x4_translation(self.position.x, self.position.y, self.position.z)
        self.viewMatrix = transform.inverse
    }

    /// Get the Projection View matrix of the camera
    public func getProjectionViewMatrix() -> simd_float4x4 {
        return projectionMatrix * viewMatrix
    }

    /// Get the projection matrix of the camera
    public func getProjectionMatrix() -> simd_float4x4 {
        self.projectionMatrix
    }

    /// Get the view matrix of the camera
    public func getViewMatrix() -> simd_float4x4 {
        self.viewMatrix
    }

    /// Get the Camera Constants for use in loading to the GPU
    public func getCameraConstants() -> CameraConstants {
        return CameraConstants(projectionMatrix: projectionMatrix, viewMatrix: viewMatrix)
    }

    /// Set the aspect ratio
    /// - Parameter width
    /// - Parameter height
    public func setAspectRatio(width: Float, height: Float) {
        self.aspectRatio = width / height
    }

    /// Get the aspect ratio
    public func getAspectRatio() -> Float {
        self.aspectRatio
    }
    
}
