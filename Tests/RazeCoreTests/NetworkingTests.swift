//
//  NetworkingTests.swift
//  RazeCoreTests
//
//  Created by Julio Montoya on 5/28/20.
//

import XCTest
@testable import RazeCore

public class NetworkSessionMock: NetworkSession {
  
  // MARK: - Properties
  var data: Data?
  var error: Error?
  
  public func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
    completionHandler(data, error)
  }
}

class NetworkingTests: XCTestCase {
  
  static var allTests = [
    ("testLoadDataCall", testLoadDataCall)
  ]
  
  func testLoadDataCall() {
    let manager = RazeCore.Networking.Manager()
    let session = NetworkSessionMock()
    manager.session = session
    let expectation = XCTestExpectation(description: "Call for data")
    let data = Data([0, 1, 0, 1])
    session.data = data
    let url = URL(fileURLWithPath: "url")
    
    manager.loadData(from: url) { result in
      expectation.fulfill()
      switch result {
      case .success(let returnedData):
        XCTAssertEqual(data, returnedData, "Manager returned unexpected data")
      case .failure(let error):
        XCTFail(error?.localizedDescription ?? "error forming error result")
      }
    }
    
    wait(for: [expectation], timeout: 5)
  }
}
