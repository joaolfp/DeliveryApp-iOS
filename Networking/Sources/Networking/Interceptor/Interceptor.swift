//
//  Interceptor.swift
//  
//
//  Created by João Lucas on 23/02/24.
//

import Foundation

public protocol Interceptor {
    func intercept(_ request: URLRequest) -> URLRequest
}
