//
//  AddressEndpoint.swift
//
//
//  Created by João Lucas on 01/10/23.
//

import Foundation
import Networking

enum AddressEndpoint {
    case getAddressList
}

extension AddressEndpoint: EndpointProtocol {
    var scheme: APIScheme {
        return .https
    }
    
    var host: String {
        return "raw.githubusercontent.com"
    }
    
    var path: String {
        switch self {
        case .getAddressList:
            return "/devpass-tech/challenge-delivery-app/main/api/address_search_results.json"
        }
    }
    
    var parameters: APIParameters? {
        return nil
    }
    
    var body: APIBody? {
        return nil
    }
    
    var method: APIMethod {
        switch self {
        case .getAddressList:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Content-type": "application/json"]
    }
}
