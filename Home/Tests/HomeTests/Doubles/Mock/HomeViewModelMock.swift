//
//  HomeViewModelMock.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import Foundation
import ViewState
import Networking
import TestUtils
@testable import Home

final class HomeViewModelMock: HomeViewModelProtocol {
    
    private var viewState = ViewState<[RestaurantsDTO], APIError>()
    
    enum StateMock {
        case success
        case failure
    }
    
    private let stateMock: StateMock
    
    init(stateMock: StateMock) {
        self.stateMock = stateMock
    }
    
    func fetchRestaurants() -> ViewState<[Home.RestaurantsDTO], Networking.APIError> {
        viewState.fetchSource {
            switch self.stateMock {
            case .success:
                let restaurants: [RestaurantsDTO] = JSONHelper.loadJSON(withFile: "RestaurantList", inBundleWithName: "Home", path: "JSON")!
                self.viewState.success(data: restaurants)
            case .failure:
                self.viewState.error(error: APIError.jsonParsingFailure)
            }
        }
        
        return viewState
    }
}
