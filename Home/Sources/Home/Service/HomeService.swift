//
//  HomeService.swift
//  
//
//  Created by joao.lucas.f.pereira on 25/03/23.
//

import Foundation
import Networking

protocol HomeServiceProtocol {
    func getRestaurantsList(completion: @escaping (Result<[RestaurantsDTO], APIError>) -> Void)
}

final class HomeService: HomeServiceProtocol {
    
    private let client: APIClientProtocol
    
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func getRestaurantsList(completion: @escaping (Result<[RestaurantsDTO], APIError>) -> Void) {
        let endpoint: HomeEndpoint = .getRestaurantList
        let request = endpoint.request
        
        client.request(request, completion: completion)
    }
}
