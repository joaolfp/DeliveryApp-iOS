//
//  BaseURL.swift
//
//
//  Created by João Lucas on 23/03/24.
//

import Foundation
import Networking

public extension EndpointProtocol {
    
    var scheme: APIScheme {
        return .https
    }
    
    var host: String {
        return "raw.githubusercontent.com"
    }
}
