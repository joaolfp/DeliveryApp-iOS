//
//  HomeEndpoint.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
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
            return "/devpass-tech/challenge-delivery-app/main/api/home_restaurant_list.json"
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
