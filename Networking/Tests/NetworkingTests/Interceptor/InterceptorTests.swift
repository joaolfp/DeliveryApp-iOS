//
//  Interceptor.swift
//
//
//  Created by João Lucas on 23/02/24.
//

import XCTest
@testable import Networking

final class RequestInterceptorTests: XCTestCase {
    
    func testInterceptAddsContentTypeHeader() {
        let interceptor = RequestInterceptor()
        let request = URLRequest(url: URL(string: "https://www.example.com")!)
        let modifiedRequest = interceptor.intercept(request)
        
        XCTAssertEqual(modifiedRequest.value(forHTTPHeaderField: "Content-type"), "application/json", 
                       "O cabeçalho Content-Type não foi adicionado corretamente")
    }
}
