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
        .https
    }

    var host: String {
        "raw.githubusercontent.com"
    }

    var path: String {
        switch self {
        case .getAddressList:
            "/joaolfp/DeliveryApp-iOS/main/api/address.json"
        }
    }

    var parameters: APIParameters? {
        nil
    }

    var body: APIBody? {
        nil
    }

    var method: APIMethod {
        switch self {
        case .getAddressList:
            .get
        }
    }
    
    var headers: Headers? {
        return nil
    }
}
