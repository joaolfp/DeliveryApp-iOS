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
        .https
    }

    var host: String {
        "raw.githubusercontent.com"
    }

    var path: String {
        switch self {
        case .getRestaurantList:
            "/joaolfp/DeliveryApp-iOS/main/api/home_restaurant_list.json"
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
        case .getRestaurantList:
            .get
        }
    }
}
