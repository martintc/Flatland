import XCTest
import simd
@testable import Flatland

final class MathTests: XCTestCase {
    func testMatrix4x4Translation() {
        let matrix = matrix4x4_translation(1, 1, 1)

        let expected = simd_float4x4(simd_float4(1, 0, 0 ,0),
                                     simd_float4(0, 1, 0, 0),
                                     simd_float4(0, 0, 1, 0),
                                     simd_float4(1, 1, 1, 1))

        for i in 0...3 {
            XCTAssertEqual(matrix[i], expected[i])
        }
        
    }
}
