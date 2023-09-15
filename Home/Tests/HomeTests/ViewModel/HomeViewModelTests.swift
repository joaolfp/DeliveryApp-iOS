//
//  HomeViewModelTests.swift
//  
//
//  Created by João Lucas on 08/07/23.
//

import XCTest
import Core
import Networking
import TestUtils
@testable import Home

final class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    var service: HomeService!
    var mock: APIClientMock!
    
    override func setUp() {
        super.setUp()
        
        mock = APIClientMock()
        service = HomeService(client: mock)
        sut = HomeViewModel(service: service)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mock = nil
        service = nil
        sut = nil
    }
    
    func testVerifyRestaurantListWithSuccess() {
        mock.fileJson = "RestaurantList"
        mock.module = "Home"
        
        let states = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(states.onLoading)
            .successObserver(states.onSuccess)
            .errorObserver(states.onFailure)
    }
    
    func verifyRestaurantListWithFailure() {
        mock.failure = true
        mock.module = "Home"
        
        let states = HomeViewModelStates()
        
        sut.fetchRestaurants()
            .loadingObserver(states.onLoading)
            .successObserver(states.onSuccess)
            .errorObserver(states.onFailure)
    }

}

final class HomeViewModelStates {
    
    func onLoading() { }
    
    func onSuccess(restaurants: [RestaurantsDTO]) {
        XCTAssertEqual(restaurants[0].name, "Benjamin a Padaria")
        XCTAssertEqual(restaurants[0].category, "Padaria")
        XCTAssertEqual(restaurants[0].deliveryTime.max, 33)
        XCTAssertEqual(restaurants[0].deliveryTime.min, 23)
    }
    
    func onFailure(error: APIError) {
        XCTAssertEqual(error.localizedDescription, "JSON parsing failure")
    }
}
