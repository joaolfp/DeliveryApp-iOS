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

    var path: String {
        switch self {
        case .getRestaurantList:
            return "/joaolfp/DeliveryApp-iOS/main/api/home_restaurant_list.json"
        }
    }

    var method: APIMethod {
        switch self {
        case .getRestaurantList:
            return .get
        }
    }
    
    var headers: Headers? {
        return nil
    }
}
