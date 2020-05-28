import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {

  static var allTests = [
    ("testColorRedEqual", testColorRedEqual),
    ("testRazeColorsAreEqual", testRazeColorsAreEqual),
    ("testSecondaryRazeColorsAreEqual", testSecondaryRazeColorsAreEqual)
  ]
  
  func testColorRedEqual() {
    let color = RazeCore.colorFromHexString("FF0000")
    XCTAssertEqual(color, .red)
  }
  
  func testRazeColorsAreEqual() {
    let color = RazeCore.colorFromHexString("006736")
    XCTAssertEqual(color, RazeCore.razeColor)
  }
  
  func testSecondaryRazeColorsAreEqual() {
     let color = RazeCore.colorFromHexString("FCFFFD")
     XCTAssertEqual(color, RazeCore.secondayRazeColor)
  }
}
