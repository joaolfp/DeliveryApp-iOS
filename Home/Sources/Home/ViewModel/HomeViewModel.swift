//
//  HomeViewModel.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation
import ViewState
import Networking

protocol HomeViewModelProtocol {
    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError>
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var viewState = ViewState<[RestaurantsDTO], APIError>()
    private let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError> {
        viewState.fetchSource { self.stateRestaurants() }
        return viewState
    }
    
    private func stateRestaurants() {
        self.service.getRestaurantsList { result in
            switch result {
            case .success(let restaurants):
                self.viewState.success(data: restaurants)
            case .failure(let error):
                self.viewState.error(error: error)
            }
        }
    }
}
