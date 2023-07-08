//
//  APIEndpointProtocol.swift
//  
//
//  Created by João Lucas on 25/03/23.
//

import Foundation

public typealias HTTPHeaders = [String: String]
public typealias APIParameters = [String: String]
public typealias APIBody = [String: Any]

public protocol EndpointProtocol {
    var scheme: APIScheme { get }
    var host: String { get }
    var path: String { get }
    var parameters: APIParameters? { get }
    var body: APIBody? { get }
    var method: APIMethod { get }
    var headers: HTTPHeaders? { get }
}

extension EndpointProtocol {
    public var urlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = scheme.toString()
        components.host = host
        components.path = path
        components.queryItems = parameters?.queryItems
        return components
    }

    @available(iOS 11.0, *)
    public var request: URLRequest {
        var request = URLRequest(with: urlComponents.url)
        request.httpMethod = method.toString()
        request.httpBody = body?.dataEncoded
        request.allHTTPHeaderFields = headers
        return request
    }
}
