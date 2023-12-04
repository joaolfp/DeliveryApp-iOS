//
//  APIClientProtocol.swift
//
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

public protocol APIClientProtocol {
    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)?, completion: @escaping (Result<T, APIError>) -> Void)
    func cancelRequests()
}

public extension APIClientProtocol {

    func request<T: Decodable>(_ request: URLRequest, decode: ((T) -> T)? = nil, completion: @escaping (Result<T, APIError>) -> Void) {
        self.request(request, decode: decode, completion: completion)
    }
}
