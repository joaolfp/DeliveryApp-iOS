//
//  HomeViewModelMock.swift
//
//
//  Created by João Lucas on 08/07/23.
//

import Foundation
@testable import Home
import Networking
import Persistence
import TestUtils
import ViewState

final class HomeViewModelMock: HomeViewModelProtocol {
    var didSetAddress: ((String) -> Void)?

    private var viewState = ViewState<[RestaurantsDTO], APIError>()

    enum StateMock {
        case success
        case failure
    }

    enum StatePersistence {
        case withValue
        case withoutValue
    }

    private let stateMock: StateMock
    private let statePersistence: StatePersistence

    init(stateMock: StateMock, statePersistence: StatePersistence) {
        self.stateMock = stateMock
        self.statePersistence = statePersistence
    }

    func fetchRestaurants() -> ViewState<[RestaurantsDTO], APIError> {
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

    func fetchAddress(keychain: KeychainProtocol) {
        switch statePersistence {
        case .withValue:
            didSetAddress?("R. Guirantiga, 500")
        case .withoutValue:
            didSetAddress?("Endereço não encontrado")
        }
    }
}
