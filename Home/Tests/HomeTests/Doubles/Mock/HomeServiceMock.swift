//
//  HomeServiceMock.swift
//
//
//  Created by João Lucas on 19/09/23.
//

import Foundation
import Networking
import TestUtils
@testable import Home

final class HomeServiceMock: HomeServiceProtocol {

    enum StateMock {
        case success
        case failure
    }

    private let stateMock: StateMock

    init(stateMock: StateMock) {
        self.stateMock = stateMock
    }

    func getRestaurantsList(completion: @escaping (Result<[RestaurantsDTO], APIError>) -> Void) {
        switch stateMock {
        case .success:
            let restaurants: [RestaurantsDTO] = JSONHelper.loadJSON(withFile: "RestaurantList", inBundleWithName: "Home", path: "JSON")!
            completion(.success(restaurants))
        case .failure:
            completion(.failure(APIError.jsonParsingFailure))
        }
    }
}
