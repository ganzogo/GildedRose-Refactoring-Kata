import XCTest
@testable import GildedRose

class IntClampingTests: XCTestCase {
    
    func testClamping() throws {
        
        // No clamping occurs
        XCTAssertEqual(0.clamping(min: 0, max: 2), 0)
        XCTAssertEqual(1.clamping(min: 0, max: 2), 1)
        XCTAssertEqual(2.clamping(min: 0, max: 2), 2)
        
        // Clamping to min
        XCTAssertEqual((-1).clamping(min: 0, max: 2), 0)
        
        // Clamping to max
        XCTAssertEqual(3.clamping(min: 0, max: 2), 2)
    }
    
}
