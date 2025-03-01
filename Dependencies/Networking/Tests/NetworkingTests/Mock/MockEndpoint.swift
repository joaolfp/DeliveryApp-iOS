//
//  MockEndpoint.swift
//
//
//  Created by João Lucas on 23/03/24.
//

import Foundation
@testable import Networking

struct MockEndpoint: EndpointProtocol {
    var scheme: APIScheme {
        return .https
    }
    
    var host: String {
        return "chapolincolorado.com"
    }
    
    var path: String {
        return "/nao/contavam/com/minha/astucia"
    }
    
    var parameters: APIParameters? {
        return ["param": "value"]
    }
    
    var body: APIBody? {
        return nil
    }
    
    var method: APIMethod {
        return .get
    }
    
    var headers: Headers? {
        return nil
    }
}
