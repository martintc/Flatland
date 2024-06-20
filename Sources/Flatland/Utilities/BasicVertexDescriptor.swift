//
//  BasicVertexDescriptor
//  Flatland
//
//  Created by Todd Martin 6/10/24
//

import Metal
import simd

public class BasicVertexDescriptor {

    public var vertexDescriptor: MTLVertexDescriptor

    public init() {
        let mvd = MTLVertexDescriptor()

        mvd.layouts[0].stepFunction = .perVertex
        mvd.layouts[0].stepRate = 1
        mvd.layouts[0].stride = MemoryLayout<simd_float3>.stride
        
        mvd.attributes[0].format = .float3
        mvd.attributes[0].bufferIndex = 0
        mvd.attributes[0].offset = 0

        self.vertexDescriptor = mvd
    }
    
}
