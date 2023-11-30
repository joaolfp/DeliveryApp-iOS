//
//  APIClientMock.swift
//  
//
//  Created by João Lucas on 26/03/23.
//

import Foundation
import Networking

public final class APIClientMock: APIClientProtocol {
   
    public var fileJson = String()
    public var module = String()
    public var failure: Bool = false
    public var isCancelled = false
    
    public init() {}

    public func request<T>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void) where T: Decodable {

        guard !failure else {
            return completion(.failure(.jsonParsingFailure))
        }

        let decodable: T = JSONHelper.loadJSON(withFile: fileJson, inBundleWithName: module, path: "JSON")!
        return completion(.success(decodable))
    }

    public func cancelRequests() {
        self.isCancelled = true
    }
}
