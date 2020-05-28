//
//  NetworkingTests.swift
//  RazeCoreTests
//
//  Created by Julio Montoya on 5/28/20.
//

import XCTest
@testable import RazeCore

class NetworkingTests: XCTestCase {
  
  static var allTests = [
    ("testLoadDataCall", testLoadDataCall)
  ]
  
  func testLoadDataCall() {
    let manager = RazeCore.Networking.Manager()
    let expectation = XCTestExpectation(description: "Call for data")
    guard let url = URL(string: "http://raywenderlich.com") else {
      return XCTFail("Coudl not create URL propertly")
    }
    
    manager.loadData(from: url) { result in
      expectation.fulfill()
      switch result {
      case .success(let returnedData):
        XCTAssertNotNil(returnedData, "Response data is nil")
      case .failure(let error):
        XCTFail(error?.localizedDescription ?? "error forming error result")
      }
    }
    
    wait(for: [expectation], timeout: 5)
  }
}
