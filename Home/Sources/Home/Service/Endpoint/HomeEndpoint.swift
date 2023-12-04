//
//  HomeEndpoint.swift
//
//
//  Created by João Lucas on 25/03/23.
//

import Foundation
import Networking

enum HomeEndpoint {
    case getRestaurantList
}

extension HomeEndpoint: EndpointProtocol {
    var scheme: APIScheme {
        return .https
    }

    var host: String {
        return "raw.githubusercontent.com"
    }

    var path: String {
        switch self {
        case .getRestaurantList:
            return "/joaolfp/DeliveryApp-iOS/main/api/home_restaurant_list.json"
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
        case .getRestaurantList:
            return .get
        }
    }

    var headers: HTTPHeaders? {
        return ["Content-type": "application/json"]
    }
}
