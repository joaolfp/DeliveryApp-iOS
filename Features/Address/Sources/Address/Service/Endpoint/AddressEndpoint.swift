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

    var path: String {
        switch self {
        case .getAddressList:
            return "/joaolfp/DeliveryApp-iOS/main/api/address.json"
        }
    }

    var method: APIMethod {
        switch self {
        case .getAddressList:
            return .get
        }
    }
    
    var headers: Headers? {
        return nil
    }
}
