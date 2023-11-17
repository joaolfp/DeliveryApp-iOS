//
//  HomeViewModel.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation
import ViewState
import Networking
import Persistence

protocol HomeViewModelProtocol {
    var didSetAddress: ((String) -> Void)? { get set }
    
    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError>
    func fetchAddress(keychain: KeychainProtocol)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var viewState = ViewState<[RestaurantsDTO], APIError>()
    private let service: HomeServiceProtocol
    
    var didSetAddress: ((String) -> Void)?
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError> {
        viewState.fetchSource { self.stateRestaurants() }
        return viewState
    }
    
    func fetchAddress(keychain: KeychainProtocol) {
        let addressValue = keychain.getValue(forKey: .address)
        didSetAddress?(addressValue ?? Localizable.addressNotFound.rawValue)
    }
    
    private func stateRestaurants() {
        self.service.getRestaurantsList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let restaurants):
                self.viewState.success(data: restaurants)
            case .failure(let error):
                self.viewState.error(error: error)
            }
        }
    }
}
