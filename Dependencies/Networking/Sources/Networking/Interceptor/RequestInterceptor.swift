//
//  RequestInterceptor.swift
//
//
//  Created by João Lucas on 23/02/24.
//

import Foundation

public final class RequestInterceptor: Interceptor {
    
    public init() {}

    public func intercept(_ request: URLRequest) -> URLRequest {
        var modifiedRequest = request
        
        modifiedRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return modifiedRequest
    }
}
