//
//  Networking.swift
//  RazeCore
//
//  Created by Julio Montoya on 5/28/20.
//

import Foundation

extension RazeCore {
  public class Networking {
    
    /// Responsible for handling all networking calls
    /// - Warning: Must creare before using any public API's
    public class Manager {
      
      // MARK: - Properties
      private let session = URLSession.shared
      
      // MARK: - Object Lifecycle
      public init() {
        
      }
      
      // MARK: - Cases
      public enum NetworkResult<Value> {
        case success(Value)
        case failure(Error?)
      }
      
      // MARK: - Body
      public func loadData(from url: URL, completionHandler: @escaping (NetworkResult<Data>) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
          let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
          completionHandler(result)
        }
        
        task.resume()
      }
    }
  }
}
