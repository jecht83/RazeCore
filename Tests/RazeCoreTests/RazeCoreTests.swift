import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {

  static var allTests = [
    ("testColorRedEqual", testColorRedEqual),
  ]
  
  func testColorRedEqual() {
    let color = RazeCore.colorFromHexString("FF0000")
    XCTAssertEqual(color, .red)
  }
}
